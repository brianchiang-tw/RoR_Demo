Rails.application.routes.draw do

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
	match ':controller(/:action(/:id(.:format)))', :via  => :all



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


