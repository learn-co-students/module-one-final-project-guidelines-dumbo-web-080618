require 'bundler'
require 'base64'
require 'tty-prompt'
Bundler.require

ActiveRecord::Base.logger = nil
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

def prompt
TTY::Prompt.new
end
