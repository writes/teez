# teez

## Install

```
export PRINTFUL_API_KEY=<printful api key>

bundle install

rails g spree:install --user_class=Spree::User
rails g spree:auth:install
rails g spree_gateway:install
```

disable migrations, sample data and seeding on install with
```
rails g spree:install --migrate=false --sample=false --seed=false
```
