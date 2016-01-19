class CreateGenerators < ActiveRecord::Migration
  def change
    create_table :generators do |t|
      t.string   :name
      t.boolean  :is_private
      t.integer  :author_id

      t.timestamps null: false
    end
  end
end
