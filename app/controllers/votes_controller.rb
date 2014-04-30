class VotesController < ApplicationController

	def create

		@story = Story.find(params[:story_id])

		# make a new vote on this story, the "find all the votes" is like finding the right column to 
		# put the vote in and then create a new entry in the correct row
		@vote = @story.votes.new

		# put an IP address in as a parameter to the vote
		# but it has to be automatic
		# save the IP address to the vote and restrict number of votes
		# want the IP address to be uniqure per story, but that is vote.rb
		@vote.ip_address = request.ip

		if @vote.save

			flash[:success] = "You have voted this story up"

		else 

			flash[:error] = "You have already voted on this story"
			
		end

		redirect_to story_path(@story)

	end


end
