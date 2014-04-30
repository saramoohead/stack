class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

    	# I want to link the comment table with a story
    	# and we use _id for the story. we'll also need a user one, but for now, just story.
    	# interger is a whole number
    	t.integer :story_id

    	# two different types of inputs on forms: short inputs and big text fields, big text saved differently in databases
    	# we need to save comments as paragraphs, so they can store paragraphs, not as a string but as a text column
    	t.text :body


      t.timestamps
    end
  end
end
