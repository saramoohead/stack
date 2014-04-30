class Story < ActiveRecord::Base
	#To read it as English" class=a "A story" then use lines below to finish sentence

	# associations: my story has many comments
	has_many :comments
	has_many :votes

 	# i want to check that the data is what i expect, avoid getting hacked
 	validates :title, presence: true, length: { minimum: 5 }

 	# the ":title" is the thing that doesn't change, making is absolute, like the $ in front of the column number in excel

 	validates :description, presence: true
 	validates :link, presence: true, uniqueness: { message: "has already been submitted" }

	# true doesn't need quotes because it is Boolean, basic part of programming language
	# but it also enables all the defaults. so, remove "true" to customise message, etc

end
