Deface::Override.new virtual_path: "spree/home/index",
                     name: "add_homepage_title",
                     insert_before: "[data-hook=homepage_products]",
                     namespaced: true do
  <<-HTML
    <% self.title = Spree::Config[:homepage_title] if Spree::Config[:homepage_title].present? %>
  HTML
end
