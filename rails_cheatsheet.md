# RAILS set up CHEAT SHEET


Covers:

* Installation and set up with Postgres RSpec and Capybara


Installation
---
- run `gem install rails`
- initialise the project with `rails new project_name`
- if you want to turn off default database and test suite of rails and replace with your own, include the -d and -T flags like so..
`rails new project_name -d postgresql -T`


* You can see your server hosted at localhost:3000 by running `rails server`

* maybe you need a database, run `bin/rake db:create` to get one (rails has lots of rake tasks)

* if you already have the database(s) but need to update them it's `bin/rake db:migrate RAILS_ENV=env_name`

* check out in the `project_name` directory what else rails has set up for you



Setting up RSpec and Capybara
---
- add to your Gemfile
```
group :test do
  gem 'rspec-rails'
  gem 'capybara'
end
```

- run `bundle` to install those gems
- run ` bin/rails generate rspec:install`
- check out what's been set up in `spec` directory
- in `spec/rails_helper.rb` go and `require 'capybara/rails'` to let everyone know capybara will also be used in spec directory
- create a `features` directory in `spec` directory where you can write Capybara feature tests (suffix them with `_spec`)
