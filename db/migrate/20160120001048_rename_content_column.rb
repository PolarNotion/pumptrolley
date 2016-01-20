class RenameContentColumn < ActiveRecord::Migration
  def change
    rename_column :snippets, :content, :install_content
  end
end
