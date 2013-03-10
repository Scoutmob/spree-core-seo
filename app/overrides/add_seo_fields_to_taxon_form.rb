Deface::Override.new virtual_path: "spree/admin/taxons/_form",
                     name: "add_seo_fields_to_taxon_form",
                     insert_bottom: "[data-hook=admin_inside_taxon_form]",
                     partial: "spree/admin/taxons/seo_fields",
                     namespaced: true