# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

Home page:
!["Home page"](https://github.com/iyriss/jungle-rails/blob/master/docs/Home_page.png?raw=true)

Checkout page:
!["Empty cart"](https://github.com/iyriss/jungle-rails/blob/master/docs/Empty_cart.png?raw=true)
!["Cart with items"](https://github.com/iyriss/jungle-rails/blob/master/docs/Cart_with_items.png?raw=true) 

Item description:
!["Item description"](https://github.com/iyriss/jungle-rails/blob/master/docs/Apparel_product_description.png?raw=true)

Admin pages:
!["Admin products"](https://github.com/iyriss/jungle-rails/blob/master/docs/Admin_products.png?raw=true)
!["Admin new product form"](https://github.com/iyriss/jungle-rails/blob/master/docs/Admin_new_product.png?raw=true)
!["Admin dashboard"](https://github.com/iyriss/jungle-rails/blob/master/docs/Admin_dashboard.png?raw=true) 

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
