class AddPrivacyTokenToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :privacy_token, :string
  end
end
