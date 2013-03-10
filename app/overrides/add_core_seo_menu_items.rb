Deface::Override.new virtual_path: "spree/admin/shared/_configuration_menu",
                     name: "add_core_seo_menu_items",
                     insert_bottom: "[data-hook=admin_configurations_sidebar_menu]",
                     namespaced: true do
  <<-HTML
    <%= configurations_sidebar_menu_item(t('sitewide_seo'), edit_admin_sitewide_seo_path) %>
  HTML
end
