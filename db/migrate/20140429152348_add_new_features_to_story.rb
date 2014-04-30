class AddNewFeaturesToStory < ActiveRecord::Migration
  def change
  	# I want to add columns to stories table
  	add_column :stories, :is_featured, :boolean, default: false
  	add_column :stories, :votes_count, :integer
  	add_column :stories, :comments_count, :integer
  end
end
