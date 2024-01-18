Rails.application.routes.draw do
  post 'createuserandmember', to: 'member#createuserandmember'
  get 'viewmember', to: 'member#viewmembers'
  post 'authenticate', to: 'users#authenticate'

  get 'viewprofile', to: 'profile#viewprofile'
  post 'updateprofile', to: 'profile#updateprofile'
  put 'updatepassword', to: 'users#update_password'

  get 'viewcourses', to: 'course#viewcourses'
  post 'createcourse', to: 'course#createcourse'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
