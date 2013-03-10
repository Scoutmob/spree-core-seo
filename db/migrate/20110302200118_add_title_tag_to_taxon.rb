class AddTitleTagToTaxon < ActiveRecord::Migration
  def self.up
    add_column :spree_taxons, :title_tag, :string
  end

  def self.down
    remove_column :spree_taxons, :title_tag
  end
end
