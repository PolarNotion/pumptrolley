class AddIsFeaturedToGenerators < ActiveRecord::Migration
  def change
    add_column :generators, :is_featured, :boolean, default: false
  end
end
