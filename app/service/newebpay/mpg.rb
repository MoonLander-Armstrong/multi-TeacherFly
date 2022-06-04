module Newebpay
  class Mpg
    attr_accessor :info

    def initialize(params)
      @key = ENV["newebpay_key"]
      @iv = ENV["newebpay_iv"]
      @merchant_id = ENV["merchant_id"]
      @info = {}
      set_info(params)
    end

    def form_info
      {
        MerchantID: @merchant_id,
        TradeInfo: trade_info,
        TradeSha: trade_sha,
        Version: "2.0"
      }
    end

    private

    def set_info(order)
      #必填欄位
      info[:MerchantID] = @merchant_id
      info[:RespondType] = "JSON"
      info[:TimeStamp] = Time.now.to_i.to_s
      info[:Version] = "2.0"
      info[:MerchantOrderNo] = order.slug
      info[:Amt] = order.price
      info[:ItemDesc] = order.name
      info[:LoginType] = 0

      #選填欄位
      info[:ReturnURL] = "https://2bcb-220-133-132-50.jp.ngrok.io/orders/payment_response"
      info[:NotifyURL] = ""
      info[:Email] = order.user.email
      info[:CREDIT] = 1
      #info[:TradeLimit] = 300
    end

    def trade_info 
      # AES256 加密後資訊
      aes_encode(url_encoded_query_string)
    end

    def trade_sha
      # SHA256 加密後資訊
      sha256_encode(@key, @iv, trade_info)
    end

    def url_encoded_query_string
      URI.encode_www_form(info)
    end

    def aes_encode(string)
      cipher = OpenSSL::Cipher::AES256.new(:CBC)
      cipher.encrypt
      cipher.key = @key
      cipher.iv = @iv
      cipher.padding = 0
      padding_data = add_padding(string)
      encrypted = cipher.update(padding_data) + cipher.final
      encrypted.unpack('H*').first
    end

    def add_padding(data, block_size = 32)
      pad = block_size - (data.length % block_size)
      data + (pad.chr * pad)
    end

    def sha256_encode(key, iv, trade_info)
      encode_string = "HashKey=#{key}&#{trade_info}&HashIV=#{iv}"
      Digest::SHA256.hexdigest(encode_string).upcase
    end
  end
end
