class AddPositionToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :position, :integer
  end
end
