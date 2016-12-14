Rails.application.routes.draw do

  get 'employees_concepts/index'

  get 'employees_concepts/new'

  get 'employees_concepts/create'

  get 'employees_concepts/destroy'

  get 'employees_concepts/edit'

  get 'employees_concepts/update'

  get 'employees_concepts/show'

  get 'employees_concepts/find_employees_concepts'

  get 'employees_concepts/employee_concept_params'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "static_pages#index"
  resources :companies
  resources :employees
  resources :payrolls
  resources :concepts
end
