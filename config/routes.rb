Rails.application.routes.draw do

  resources :universities
  resources :teachers

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  
  devise_scope :user do
    get 'users/post_status' , to: 'users/registrations#post_status',:as => "user_posts_status"
  end

  resources :universities, only: :index, shallow: true do
    resources :faculties, only: :index do
      resources :careers do
        resources :courses do
          resources :course_evaluations
          resources :comments
        end
      end
      resources :professors do
        resources :professor_evaluations
        resources :comments
      end
    end
  end


  root 'home#index'

end
