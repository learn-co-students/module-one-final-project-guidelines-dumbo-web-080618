class Legislator < ActiveRecord::Base
  has_many :donations
  has_many :users, through: :donations


  def self.find_by_state(state)
    senators = Legislator.all.select {|legislator| legislator.title =='sen'}
    senators.find(state: state)
  end

  def self.find_senator_or_houseRep(searchfor)
    searchfor = searchfor.slice(0,3)
    reps = Legislator.all.select {|legislator| legislator.title == searchfor}
  end

  def full_name
    full_name = ''
    Legislator.all.each do |rep|
      if rep.id == self.id
        full_name = "#{rep.first_name} #{rep.last_name}"
      end
    end
    full_name
  end

end
0
