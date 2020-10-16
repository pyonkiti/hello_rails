class AddBlogIdToEntry < ActiveRecord::Migration[5.2]
  def change
    add_reference :entries, :blog, foreign_key: true
  end
end
