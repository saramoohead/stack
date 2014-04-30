class CommentsController < ApplicationController
	def new

		# This is the comment form
		# Find the story that the new comment will be on, we have to specify story_id, because 
		# we are in the comments controller, and if we don't it will find the comment_id
		@story = Story.find(params[:story_id])

		# make a new comment on this @story variable. tell it to find the story, then specify the comment
		@comment = @story.comments.new
	
	end

	def create
		# This is actually creating a comment
		@story = Story.find(params[:story_id])
		@comment = @story.comments.new(comment_params)

		# if the comments save, go back to story page
		# if not, show new form again

		if @comment.save 
			flash[:success] = "Your comment was added."
			redirect_to story_path(@story)
			# where do I want to go back to? I want to redirect to the story path of this particular story
		else
			render "new" 
		end

	end

	def comment_params
			# whitelisted form data
			params.require(:comment).permit(:body)
	end
end
