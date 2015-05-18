Rails.application.routes.draw do

  get 'course_evaluation/create'

  resources :teacher_comments

  resources :universities
  resources :teachers

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  
  devise_scope :user do
    get 'users/post_status' , to: 'users/registrations#post_status',:as => "user_posts_status"
  end


  resources :universities, only: :index, shallow: true do

    resources :courses do
      resources :course_evaluations
      resources :course_comments
    end

    resources :teachers do
      resources :teacher_evaluations
      resources :teacher_comments
    end

  end


  root 'home#index'

end
