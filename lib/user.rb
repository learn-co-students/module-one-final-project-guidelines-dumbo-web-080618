class User < ActiveRecord::Base
  has_many :decks
  has_many :questions, through: :decks

  def self.find_or_create_by_name(name)
    if(self.find_by(name: name) != nil)
      self.find_by(name: name)
    else
      User.create(name: name)
    end
  end

  def add_a_question(topic, question, answer)
    q = Question.create(topic: topic, question: question, answer: answer)
    # binding.pry
    Deck.create(user_id: self.id, question_id: q.id, topic: q.topic)
  end

  def find_a_question(topic, question, answer)
    Question.find{|q| (q.topic == topic && q.question == question && q.answer == answer)}  
  end

  def find_or_create_question(topic, question, answer)
    q = find_a_question(topic, question, answer)
    if (q == nil)
      add_a_question(topic, question, answer)
    else
      Deck.find_or_create(self.id, q.id, q.topic)
    end
  end

end