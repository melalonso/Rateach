Rails.application.routes.draw do

  resources :course_comments

  resources :faculties
  resources :teacher_comments

  resources :universities
  resources :teachers

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  
  devise_scope :user do
    get 'users/post_status' , to: 'users/registrations#post_status',:as => "user_posts_status"
  end


  resources :universities, only: :index, shallow: true do

    resources :faculties do
      resources :teachers do
        resources :teacher_evaluations
        resources :teacher_comments
      end
      resources :courses do
        resources :course_evaluations
        resources :course_comments
      end
    end
  end

  get "/course/new" => "courses#new", :as => 'new_course'
  get "/courses" => "courses#index", :as => 'courses'
  post "/courses" => "courses#create"
  get "/admin" => "pages#admin", :as => "admin_courses_teachers"
  get "/admin/courses" => "pages#admin_courses", :as => "admin_courses"
  get "/admin/teachers" => "pages#admin_teachers", :as => "admin_teachers"
  get "/search" => "pages#search", :as => "search"
  get "/search/results" => "pages#search_results"
  root 'pages#index'

end
