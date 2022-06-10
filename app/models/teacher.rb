class Teacher < ApplicationRecord
  include Slugable

  # devise setting
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable,
        :omniauthable, omniauth_providers: [:google_oauth2]

  # 定義類別方法，找到user的話就登入，找不到就建立user
  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |teacher|
      teacher.email = provider_data.info.email
      teacher.password = Devise.friendly_token[0, 20]
      teacher.username = provider_data.info.name
      teacher.domain = "teacherfly.site"
      teacher.subdomain = SecureRandom.hex(3)
    end
  end

  # validates
  validates :username, length: { maximum: 20 }
  validates :school_name, length: { maximum: 8 }
  validates :subdomain, presence: true,
                        uniqueness: true,
                        length: { minimum: 3, maximum: 10 },
                        format: { with: /\A\w[a-z0-9]{2,10}\z/ }

  # relationship
  has_many :students
  has_many :courses
  has_one_attached :avatar, dependent: :destroy
  has_one_attached :logo, dependent: :destroy
end
