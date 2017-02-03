class RenameArticlesId < ActiveRecord::Migration[5.0]
  def change
  	rename_column :taggings, :articles_id, :article_id
  end
end
