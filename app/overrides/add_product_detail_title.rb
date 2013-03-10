Deface::Override.new virtual_path: "spree/products/show",
                     name: "add_product_detail_title",
                     insert_before: "[data-hook=product_show]",
                     namespaced: true do
  <<-HTML
    <% if defined?(@product.title_tag) and @product.title_tag.present? %>
      self.title = @product.title_tag
    <% end %>
  HTML
end
