require 'bundler'
require 'colorize'
require 'base64'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'


#prompt = TTY::Prompt.new
