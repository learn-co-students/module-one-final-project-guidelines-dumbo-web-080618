require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
ActiveRecord::Base.logger = nil

def clear_screen
  system "clear" or system "cls"
end
