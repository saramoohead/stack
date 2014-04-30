class Comment < ActiveRecord::Base

	# associations: my comments belongs to a story
	belongs_to :story, counter_cache: true
	# reading it in English, starting with class Comment, we say "a Comment" then to this line
	# "a Comment belongs to the story" - but we also have to tell the Story that a comment belongs to it

	# add validations
	validates :body, presence: true
end
