require_relative '../config/environment'
ActiveRecord::Base.logger = nil
require 'pry'

start_menu
choose_menu
