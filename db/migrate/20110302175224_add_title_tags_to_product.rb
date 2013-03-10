class AddTitleTagsToProduct < ActiveRecord::Migration
  def self.up
    add_column :spree_products, :title_tag, :string
  end

  def self.down
    remove_column :spree_products, :title_tag
  end
end
