class RemoveTitleTagColumnFromTaxons < ActiveRecord::Migration
  def up
    if column_exists? :spree_taxons, :title_tag
      execute "UPDATE spree_taxons SET meta_title = title_tag WHERE title_tag IS NOT NULL AND title_tag <> '' AND (meta_title IS NULL OR meta_title = '')"
      remove_column :spree_taxons, :title_tag
    end
  end

  def down
    add_column :spree_taxons, :title_tag, :string
    execute "UPDATE spree_taxons SET title_tag = meta_title"
  end
end
