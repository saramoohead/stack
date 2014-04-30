Rails.application.routes.draw do
 
 	#active admin auto added these two lines
  	devise_for :admin_users, ActiveAdmin::Devise.config
  	ActiveAdmin.routes(self)
	
	# We want the ability to add, edit, delete stories
	# in Rails there are seven default actions
	# They are: index, show
	# new, create
	# edit, update
	# destroy
	# (Create Read Update Destroy = CRUD)
	# new is the form, create is the database, edit is the form, update is the database
	# Representational State Transfer REST
	# we are making a resource for stories
	resources :stories do
		#comments are related to stories, so URLs will be related, too
		resources :comments

		# votes are also related to stories
		resources :votes
		
		end

 	 # set up a URL for the homepage
 	 root "stories#index"

 	 # if I was going to do a completely separate section of jobs, just add jobs with resources. 
 	 # but comments are associated with stories, so we use the do and end
end
