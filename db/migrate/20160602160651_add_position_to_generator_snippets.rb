class AddPositionToGeneratorSnippets < ActiveRecord::Migration
  def change
    add_column :generator_snippets, :position, :integer
  end
end
