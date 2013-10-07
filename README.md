# Sentiment-API on Rails

Embedded original [Sentiment API](https://github.com/3scale/sentiment-api-example) build using Grape framework into a Rails app

## How to use

```bash
$ git clone git@github.com:picsoung/sentiment-api-rails.git
$ cd sentiment-api-rails
$ bundle install
$ rails s
```

The API is available at http://localhost:3000/api/v2/words/hello.json

## Step-by-step

1. Follow [@njyx](https://github.com/njyx)'s tutorial about how to implement a simple API using Grape framework and 3scale. [link](http://www.3scale.net/2012/06/the-10-minute-api-up-running-3scale-grape-heroku-api-10-minutes/)
2. Create an empty Rails app
   `rails new my-app`

3. Create a directory `api` under `app` folder. That's where all your API logic will go.

4. Create a empyt file `api.rb` in this new created folder

If you followed the tutorial that what you should have in your `app` folder

```
$ ls app/
app
|-- api.rb
|-- sentiment/
|   |-- analyser.rb
|   |-- sentiment.rb
|   |-- data/
|   |   |-- working_AFINN-111.txt

```

5. in `app/api/api.rb`

```ruby
class API < Grape::API
  prefix 'api' # optional, it makes you api available at myserver.com/api/
  mount Sentiment::Ress
end
```

6. Rename `sentiment.rb` in `app/api/sentiment/` to `ress.rb` and edit the file so it looks like this

```ruby
module Sentiment
  class Ress < Grape::API
  	# Keep API logic like before
  end
end
```

7. Now edit `config/application.rb` and add those lines to take load new files added

```ruby
config.paths.add "app/api", :glob => "**/*.rb"
config.autoload_paths += Dir["#{Rails.root}/app/api/*"]
```

8. Finally modify your `routes.rb` so it mounts the API class

```ruby
mount API => '/'
```

9. Your API should be ready to serve. Relaunch your server and try to access it at http://localhost:3000/api/v2/words/hello.json



