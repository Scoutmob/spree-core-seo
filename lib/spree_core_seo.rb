require 'spree_core'

module SpreeCoreSeo
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Spree::AppConfiguration.class_eval do
        preference :homepage_meta_keywords, :string
        preference :homepage_meta_description, :string
        preference :homepage_title, :string
        preference :keywords_footer, :string
      end

      Spree::BaseHelper.module_eval do
        # Override meta tags for homepage
        alias_method :meta_data_tags_without_homepage, :meta_data_tags
        def meta_data_tags
          # if product index, then it's the homepage, so lets add the defaults
          if defined?(request) and request.fullpath == "/"
            "".tap do |tags|
                if Spree::Config[:homepage_meta_keywords] and Spree::Config[:homepage_meta_keywords].present?
                tags << tag('meta', :name => 'keywords', :content => Spree::Config[:homepage_meta_keywords]) + "\n"
              end
              if Spree::Config[:homepage_meta_description] and Spree::Config[:homepage_meta_description].present?
                tags << tag('meta', :name => 'description', :content => Spree::Config[:homepage_meta_description]) + "\n"
              end
            end
          else
            meta_data_tags_without_homepage
          end
        end
      end

      Spree::Product.class_eval do
        attr_accessible :title_tag if Spree::Product.column_names.include?('title_tag')
      end

      Spree::Taxon.class_eval do
        attr_accessible :title_tag if Spree::Taxon.column_names.include?('title_tag')
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
