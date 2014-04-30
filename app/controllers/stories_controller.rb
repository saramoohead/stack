class StoriesController < ApplicationController

	# we want to add a list of all of the stories
	# in static websites, this is the index.html
	def index 

		# I want to pass some data to our html
		# This data is variable
		# so we store the data in a ruby thing called a variable
		# use an @ sign to create a variable
		#using "" for text and numbers
		@username = "Sara"

		# we want to store some stories in a list
		# in ruby we call this an array
		# using [] for strings
		# @stories = ["Google","Facebook","Twitter","Linked In"]

		# we want to get the real @stories from the database, sorted in one particular way
		# @stories = Story.order("votes_count desc, title asc")

		# now we want to sort by many things

		if params[:featured] == "true"
			# find just the featured stories
			@stories = Story.where(is_featured: true).order("created_at desc")

		elsif params[:sort] == "recent"
			# sort by recent, the sort is taken from the url that we generated in application html
			# a double equals check. single equals makes one thing another thing
			@stories = Story.order("created_at desc")
		else
			# sort by top
			@stories = Story.order("votes_count desc, title asc")
		end

	end


	def show
		# read more page
		# params get extra information from forms and urls
		@story = Story.find(params[:id])
	end

	def new
		# This is our new story form
		@story = Story.new
	end

	def create
		# actually add things to the database
		@story = Story.new(story_params)

		#save to the database
		if @story.save

			# Let the user know the creation was successful, flash is pop up
			flash[:success] = "Your story was added."

			# to define going somewhere after
			redirect_to root_path
		# don't forget to end your if (and end your def and end your do)
		
		else 
			#this hasn't saved to the database because it failed validation
			# so let's show the add a story form
			render "new" 
		end
	end

	def edit
		# This is the form to edit the story
		@story = Story.find(params[:id])		
	end

	def update
		#actually update things in the database
		@story = Story.find(params[:id])

		if @story.update(story_params)

			flash[:success] = "You have edited this story."

			redirect_to story_path(@story)

		else

			# show edit form if update validation failed
			render "edit"

		end
	end

	def destroy
		# actually delete the row/the story from the database
		@story = Story.find(params[:id])

		@story.destroy

		flash[:success] = "You have deleted this story."

		redirect_to root_path
	end

	def story_params
		# find data from the form
		# but requirements make sure it's only fitting into the database
		params.require(:story).permit(:title, :description, :link)
		
	end


end
