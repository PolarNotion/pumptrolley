class CreateGeneratorSnippets < ActiveRecord::Migration
  def change
    create_table :generator_snippets do |t|
      t.integer  :generator_id
      t.integer  :snippet_id

      t.timestamps null: false
    end
  end
end
