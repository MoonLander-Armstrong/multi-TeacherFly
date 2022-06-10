# frozen_string_literal: true
require "constraints/subdomain"

Rails.application.routes.draw do
  constraints(Subdomain) do
    scope module: "tenant" do
      root to: "courses#index", as: "teacher_root"
      get "teacher_auto_sign_in", to: "pages#auto_sign_in"
      delete "teacher_auto_sign_out",to: "pages#auto_sign_out" 
      get "teacher_update_sign_in", to: "pages#update_sign_in"
      get "owner/preview", to: "courses#index"
      devise_for :students,
                  controllers: {
                    sessions: 'tenant/students/sessions',
                    registrations: 'tenant/students/registrations',
                    passwords: 'tenant/students/passwords'
                  }

      devise_scope :student do
        delete "students/log_out", to: "students/sessions#log_out"
        get "students/information", to: "students/registrations#information"
        patch "students/information", to: "students/registrations#information_update"
      end

      # front stage
      resources :lecturers, only: [:show]
      resources :courses, only: %i[index show] do
        resources :orders, only: [] do
          collection do
            get :payment
          end
        end
        resources :sections, only: %i[show] do
          resources :comments, shallow: true, only: [:create, :destroy]
        end
      end
      resources :orders, only: [:index, :show] do
        collection do
          post :payment_response
        end
      end

      # back stage
      namespace :owner do
        resource :schools, only: [:edit, :update]
        resources :lecturers
        resources :courses do
          member do
            get :information
            get :curriculum
          end
          resources :chapters do
            resources :sections, only: [:new, :create]
            collection do
              resources :sections, except: [:new, :create] do
                resources :comments, shallow: true, only: [:create, :destroy]
              end
            end
          end
        end
        resources :students, only: [:index, :create, :update] do
          member do
            get :information
            post :subscription
          end
        end
        resources :comments, only: [:index]
        resources :orders, only: [:index] do
        end
      end

      # API
      namespace :api do
        namespace :v1 do
          resources :courses, only: [] do
            resources :sections, only: [] do
              member do
                patch :finished
              end
            end
          end
        end
      end
    end
  end
  
  # without subdomain
  root to: 'pages#home'
  devise_for :teachers,
              controllers: {
                omniauth_callbacks: 'teachers/omniauth_callbacks',
                sessions: 'teachers/sessions',
                registrations: 'teachers/registrations'
              }
  devise_scope :teacher do
    get "teacher/log_out", to: "teachers/sessions#destroy"
  end
end
