Rails.application.routes.draw do

	# RESTful style
	# Auto create named route with HTTP verbs( GET, POST, PUT, DELETE) and RoR's Actions


# 	  Prefix Verb   URI Pattern                            Controller#Action
# ===========================================================================
# 	  events GET    /events(.:format)                      events#index
# 		     POST   /events(.:format)                      events#create
#  new_event GET    /events/new(.:format)                  events#new
# edit_event GET    /events/:id/edit(.:format)             events#edit
# 	   event GET    /events/:id(.:format)                  events#show
# 		     PATCH  /events/:id(.:format)                  events#update
# 		     PUT    /events/:id(.:format)                  events#update
# 		     DELETE /events/:id(.:format)                  events#destroy



	resources :events

  	resources :people
	# maps URL http://localhost:3000/welcome/say_hello to Controller "welcome" and Action "say"
	get "welcome/say_hello" => "welcome#say"

	# maps URL http://localhost:3000/welcome to Controller "welcome" and Action "index"
	get "welcome" => "welcome#index"

	# Specify homepage as Action "index" of Controller "welcome"
	# the location of homepage is also defined as "root_path" in RoR
	root :to => "welcome#index"

	# Set wildcard route
	# maps URL http://localhost:3000/a/b to controller "a" and action "b"
	# maps URL http://localhost:3000/a/ to index action
	# match ':controller(/:action(/:id(.:format)))', :via => :all
	


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


