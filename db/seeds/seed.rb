require 'csv'
require 'pry'
require '../../models/user.rb'
require '../../models/representative.rb'
require '../../models/donation.rb'

legislators = CSV.read('../legislators.csv');
