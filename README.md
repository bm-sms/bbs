# Bbs
A Rails Engine for BBS(Bulletin Board System).

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'bbs'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install bbs
```

## Getting started
### copy migrations

```bash
$ bin/rails bbs:install:migrations
```

### Mount

Edit `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  mount Bbs::Engine => '/bbs' # choose your mount point arbitrarily
end
```

### Copy configurations to your application

```bash
$ bin/rails g bbs:config
```

Execute the above command will copy following files into your
`config/initializers`.

* config/initializers/bbs.rb
* config/locales/bbs.ja.yml
* config/locales/bbs.en.yml

### Generate User/UserProfile/Avatar models

```bash
$ rails g active_record:bbs User
```

Execute the above command will generate models(User, UserProfile and Avatar) and its migrations.

Uncomment bbs config and specify user model name arbitrary.

```ruby
config.user_class = 'User'
```

## View Components
### List categories

Component that list all categories.
In view, you have to call the cell object:

```haml
= cell('bbs/category')
```

### List latest topics

Component that list latest topics.
In view, you have to call the cell object:
```haml
= cell('bbs/latest_topics')
```
To change the number of displayed topics, change the value `config.latest_topics_count` in `config/initializers/bbs.rb` (The default is 10).

## Customization
### Copy views to your application

If you want to customize bbs views, you can copy view templates provided by this
gem using generator.

```bash
$ bin/rails g bbs:views
```

Execute the above command will copy view templates to `app/views/bbs/`.


## Contributing
1. Fork it ( http://github.com/bm-sms/bbs )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
