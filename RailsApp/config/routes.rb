Rails.application.routes.draw do
  devise_for :users
 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
get '/program/index'
	root 'program#index', order: 'asc', offset: 0
get 'firstpage', 'secondpage', 'thirdpage', 'forthpage', 'fifthpage', 'prev', 'next',to: 'program#index', order: 'asc'
get 'index', to: 'program#index', order: 'asc'
get 'asc', to: 'program#index', order: 'asc'
get '/program/search' 
get 'desc', to: 'program#order', order: 'desc'	
get 'search', to: 'program#search'
post 'show', to: 'program#show'

get 'show', to: 'program#show'
get 'program/compare'
post 'execute', to: 'program#execute'

get 'execute', to: 'program#execute'
get 'program_history', to: 'history#program_history'

get 'login_history', to: 'history#login_history' 

get 'history/login_history_pdf'
	
get 'history/program_history_pdf'
	
post 'update_user', to: 'user#update_user'

get 'add_program', to: 'program#add_program'
post 'create', to: 'program#create'
get 'create', to: 'program#create'
get	'program/add_new_program'

get 'update_program', to: 'program#update_program'

get 'update', to: 'program#update'
post 'update', to: 'program#update'

get 'destroy', to: 'program#destroy'

get 'contact_us', to: 'mail#contact_us'

get 'mail/send_mail'

get 'mail/mail_program_pdf'
 get 'mail/mail_login_pdf'
 get 'mail/mail_login_history_attachment'
get 'mail/mail_pdf'
get 'logout', to: 'user#logout'
	
end
