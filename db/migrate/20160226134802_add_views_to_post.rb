class AddViewsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :views, :integer
  end
end
