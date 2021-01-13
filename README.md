# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

!["Home Page displays all products available"](https://github.com/samamoo/jungle-rails/blob/master/docs/Screen%20Shot%202021-01-13%20at%201.33.38%20PM.png?raw=true)
!["Product details page"](https://github.com/samamoo/jungle-rails/blob/master/docs/Screen%20Shot%202021-01-13%20at%201.34.03%20PM.png?raw=true)
!["Cart of products"](https://github.com/samamoo/jungle-rails/blob/master/docs/Screen%20Shot%202021-01-13%20at%201.34.20%20PM.png?raw=true)
!["Payment prompt using Stripe"](https://github.com/samamoo/jungle-rails/blob/master/docs/Screen%20Shot%202021-01-13%20at%201.34.39%20PM.png?raw=true)

Gifs of App in Action
!["Gif of adding a product to the cart"](https://github.com/samamoo/jungle-rails/blob/master/docs/jungle_add_cart.gif?raw=true)
!["Gif of making a payment"](https://github.com/samamoo/jungle-rails/blob/master/docs/jungle_add_cart.gif?raw=true)

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
