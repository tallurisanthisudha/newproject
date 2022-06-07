Rails.application.routes.draw do
  devise_for :employees
  #get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#display"
  get 'display', to: 'home#display'
  get 'employee',to: 'home#employee'
  get 'hr',to: 'home#hr'
  get 'signnedin', to: 'home#signnedin'
  get 'dashboardopen', to: 'home#dashboardopen'
  #get 'leavespage', to: 'home#leavespage'
  get 'managerpage', to: 'manager#managerpage'
  
  #get 'adminhome', to: 'admin#adminhome'

  #get 'employeemanagement', to: 'admin#employeemanagement'
  get 'index', to: 'designations#index'
  #post 'designationmanagement', to: 'designation#create'
  get 'attendance', to: 'home#attendance'
 
  #post 'leaveform', to: 'admin#create'
  #get 'designationform', to: "designation#designationform"
  #get 'leaveform', to: "admin#leaveform"
  

  #get 'projectmanagement', to: 'project#projectmanagement'
  #get 'projectform', to: 'project#projectform'
  #post "projectform", to: 'project#create'

  #get 'holiday', to: 'holidays#holiday'
  #get 'holidaysform', to: 'holidays#holidaysform'
  #post "holidaysform", to: 'holidays#create'
  #post 'designations/new', to: "designations#create"

  resources :designations
  resources :holidays
  resources :projectmanagements
  resources :leaves
  resources :employees
  resources :employee_details
  resources :addresses
  resources :employee_leaves
  
end
