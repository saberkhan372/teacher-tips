require 'bundler'
Bundler.require

configure :development do
  set :database, "sqlite3:twitterdb/database.db"
end
