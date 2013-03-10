Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resource :sitewide_seo
  end
end
