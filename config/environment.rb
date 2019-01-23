require 'bundler'
Bundler.require

Dotenv.load

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require 'json'
require 'rest-client'
