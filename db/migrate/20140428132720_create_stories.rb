class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|

    	# I want to add some columns to our database
    	# We want to save the title and our dtat as a string (letters and numbers)
    	t.string :title
    	t.string :description
    	t.string :link
    	# You can't change this

      t.timestamps
    end
  end
end
