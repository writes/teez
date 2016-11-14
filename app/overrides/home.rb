Deface::Override.new(
  :virtual_path => 'spree/home/index',
  :name => 'home_sidebar',
  :remove => 'div[data-hook=homepage_sidebar_navigation]',
)

Deface::Override.new(
  :virtual_path => 'spree/home/index',
  :name => 'home_content',
  :replace_contents => 'div[data-hook=homepage_products]',
  :partial => 'partials/home'
)
