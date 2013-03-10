Deface::Override.new virtual_path: "spree/taxons/show",
                     name: "add_taxons_title",
                     insert_before: "[data-hook=taxon_products]",
                     namespaced: true do
  <<-HTML
    <% if defined?(@taxon.title_tag) and @taxon.title_tag.present? %>
      self.title = @taxon.title_tag
    <% end %>
  HTML
end
