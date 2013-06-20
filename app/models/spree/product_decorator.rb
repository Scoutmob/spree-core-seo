module Spree
  Product.class_eval do
    if Product.table_exists? and Product.column_names.include?('title_tag')
      attr_accessible :title_tag
    end
  end
end
