class AddIsFeaturedToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :is_featured, :boolean, default: false, null: false
  end
end
