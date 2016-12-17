Rails.application.routes.draw do

  get 'searches/search_payroll'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "static_pages#index"
  resources :searches

  resources :employees_concepts do
    collection do
      post :import
      get :load_company_info
    end
  end

    resources :companies do
      collection do
        post :import
      end
    end #companies

    resources :employees do
      collection do
        post :import
      end
    end #employees

    resources :concepts do
      collection do
        post :import
      end
    end #concepts

end
