Deface::Override.new(
  :virtual_path => 'spree/shared/_header',
  :name => 'header_content',
  :replace_contents => 'header',
  :partial => 'partials/header'
)

Deface::Override.new(
  :virtual_path => 'spree/shared/_header',
  :name => 'remove_main_nav_bar',
  :remove => '#spree-header > .container'
)
