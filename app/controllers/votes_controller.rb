class VotesController < ApplicationController

	def create

		@story = Story.find(params[:story_id])

		# make a new vote on this story, the "find all the votes" is like finding the right column to 
		# put the vote in and then create a new entry in the correct row
		@vote = @story.votes.new

		@vote.save

		flash[:success] = "You have voted this story up"

		redirect_to story_path(@story)

	end


end
