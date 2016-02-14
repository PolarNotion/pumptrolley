class AddPrivacyTokenToGenerators < ActiveRecord::Migration
  def change
    add_column :generators, :privacy_token, :string
  end
end
