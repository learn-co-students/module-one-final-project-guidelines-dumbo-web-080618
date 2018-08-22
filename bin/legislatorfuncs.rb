def find_senators
senators = Legislator.find_senator_or_houseRep(senator_or_rep_input)
end

def find_by_state(input)
  senator = []
  senators.each do |senator|
    if senator.state == input
      senator << "#{senator.first_name} #{senator.last_name}"
    end
  end
  senator
end
