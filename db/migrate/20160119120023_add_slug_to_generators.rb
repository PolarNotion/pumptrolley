class AddSlugToGenerators < ActiveRecord::Migration
  def change
    add_column :generators, :slug, :string
  end
end
