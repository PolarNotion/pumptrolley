class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string   :name
      t.text     :description
      t.text     :content
      t.text     :followup_content
      t.string   :tags
      t.string   :registration_url
      t.string   :documentation_url
      t.boolean  :is_private,       default: false, null: false
      t.integer  :parent_id
      t.integer  :author_id

      t.timestamps null: false
    end
  end
end
