# frozen_string_literal: true

Rails.application.routes.draw do
  # Take advantage of shallow routing wherever possible:
  # :index, :new, :create should be nested with parent resource
  # :show, :edit, :update, :destroy should be unnested

  root                     'static_pages#home'
  get   'about'        =>  'static_pages#about'
  get   'contact'      =>  'static_pages#contact'
  get   'develop'      =>  'static_pages#develop'

  ####################################################
  # Profiles
  # devise routes for authentication
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'registrations' }
  resources :profiles, controller: 'users' do
    resources :resumes, only: %i[index create destroy]
    get 'settings'
  end

  ####################################################
  # Organizations
  resources :organizations do
    member do
      get 'approve'
      get 'withdraw'
      get 'archive'
    end
    collection do
      get 'admin'
      get 'manage'
      get 'user'
      post 'admin', to: 'organizations#filter'
      post 'manage', to: 'organizations#filter_manage'
      post 'organizations', to: 'organizations#filter_index'
      post 'user', to: 'organizations#filter_user'
    end
    resources :jobs, only: %i[new create]
  end

  ####################################################
  # Jobs
  resources :jobs, only: %i[show edit update destroy] do
    member do
      get 'assign'
      post 'create_position'
      put 'add_user'
    end
  end

  resources :job_postings do
    resources :job_posting_questions, only: %i[index create update destroy]
    resources :job_applications, only: %i[index new create] do
      resource :job_posting_answers, only: %i[new create]
    end
    member do
      get 'approve'
      get 'withdraw'
      get 'interview'
      get 'close'
      get 'reopen'
    end
    collection do
      get 'select'
      get 'admin'
      get 'manage'
      post 'admin', to: 'job_postings#filter'
      post 'manage', to: 'job_postings#filter_manage'
      post 'job_postings', to: 'job_postings#filter_index'
    end
  end

  resources :job_applications, only: %i[show update destroy] do
    resource :job_posting_answers, only: %i[edit update destroy]
    resources :interviews, only: [:new]
    member do
      get 'select_resume'
      patch 'update_resume'
      get 'finalize'
      get 'hire'
      get 'decline'
    end
    collection do
      get 'user'
      post 'user', to: 'job_applications#filter_user'
    end
  end

  resources :interviews, only: %i[create edit update] do
    collection do
      get 'manage'
      get 'admin'
    end
  end

  resources :positions do
    collection do
      get 'admin'
    end
  end
end
