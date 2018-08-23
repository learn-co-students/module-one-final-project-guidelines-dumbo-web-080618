class Donation < ActiveRecord::Base
  belongs_to :legislator
  belongs_to :user

  TTY::Prompt.new
end
