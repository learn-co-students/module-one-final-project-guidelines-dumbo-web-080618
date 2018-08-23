class Deck < ActiveRecord::Base 
  belongs_to :question
  belongs_to :user

  def self.find_or_create(user_id, question_id, topic)
    d = Deck.find_by(user_id: user_id, question_id: question_id)
    if (d == nil)
      Deck.create(user_id: user_id, question_id: question_id, topic: topic)
    else
      puts "Question already exists in your deck."
    end
  end
end