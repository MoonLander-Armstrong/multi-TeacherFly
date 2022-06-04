# frozen_string_literal: true
require "constraints/subdomain"

Rails.application.routes.draw do
  constraints(Subdomain) do
    scope module: "tenant" do
      root to: "courses#index", as: "teacher_root"
      devise_scope :student do
        delete "students/log_out", to: "students/sessions#log_out"
      end
      devise_for :students,
                  controllers: {
                    sessions: 'tenant/students/sessions',
                    registrations: 'tenant/students/registrations',
                  }

      # front stage
      resources :lecturers, only: [:show]
      resources :courses, only: %i[index show]do
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
      namespace :owner do # remember add path: "qwerttyasad"
        resources :lecturers
        resources :courses do
          member do
            get :information
            get :curriculum
            get :comments
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
        resources :users, only: [:index, :update] do
          member do
            get :information
          end
        end
        resources :comments, only: [:index]
        resources :orders, only: [:index] do 
        end
      end
    end

    # API
    namespace :api do
      namespace :v1 do
        resources :comments, only: [] do
          member do
            post :reply
          end
        end

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

  # without subdomain
  root to: 'pages#home'
  devise_for :teachers,
              controllers: {
                omniauth_callbacks: 'teachers/omniauth_callbacks',
                sessions: 'teachers/sessions',
                registrations: 'teachers/registrations',
              }
end
