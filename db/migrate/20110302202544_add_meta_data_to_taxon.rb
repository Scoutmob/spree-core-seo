class AddMetaDataToTaxon < ActiveRecord::Migration
  def self.up
    add_column :spree_taxons, :meta_keywords, :string
    add_column :spree_taxons, :meta_description, :string
  end

  def self.down
    remove_column :spree_taxons, :meta_keywords
    remove_column :spree_taxons, :meta_description
  end
end
