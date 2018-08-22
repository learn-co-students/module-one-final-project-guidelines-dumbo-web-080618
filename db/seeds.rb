require 'csv'
require 'pry'
require_relative '../lib/legislator.rb'
require_relative '../lib/user.rb'

#legislators data was an open source resource from github https://github.com/govtrack/congress-maps
path = File.expand_path('../legislators.csv', __FILE__)
legislators = CSV.read(path);

legislators = legislators.slice(1..legislators.length)

legislators.each do |legislator|
  legislator_hash = {
    :last_name => legislator[0],
    :first_name => legislator[1],
    :birthday => legislator[2],
    :gender => legislator[3],
    :title => legislator[4],
    :state => legislator[5],
    :district => legislator[6],
    :party => legislator[7],
    :url => legislator[8],
    :address => legislator[9],
    :phone => legislator[10]
  }
  Legislator.create(legislator_hash)
end


User.destroy_all
50.times do |index|
  User.create!(name: Faker::Name.name, age: Faker::Number.between(18, 89), gender: Faker::Boolean.boolean, party: Faker::Boolean.boolean)
end
