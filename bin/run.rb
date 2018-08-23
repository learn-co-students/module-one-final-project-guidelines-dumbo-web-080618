require 'pry'
require 'colorize'
require 'rest-client'
require 'htmlentities'
require 'json'
require_relative '../config/environment'

clear_screen
over = false
user = login
clear_screen
logo

#just makes anonmymous questions for users who don't want to or have their own questions and decks for them
# def make_anon_questions
#   random_questions = []
#   questions_request = RestClient.get ('https://opentdb.com/api.php?amount=40&category=9&type=multiple')
#   questions_hash = JSON.parse(questions_request)["results"]
#   questions_hash.each{|hash| random_questions << make_question_from_hash_array(hash)}
#   binding.pry
#   random_questions
# end

# def make_question_from_hash_array (question)
#   coder = HTMLEntities.new
#   topic = coder.decode(question['category'])
#   ask = coder.decode(question['question'])
#   answer = coder.decode(question['correct_answer'])
#   output_question = Question.create(:topic => topic, :question => ask, :answer => answer, :universal => true)
# end

# x = user.add_a_question("Animals", "What animal eats bugs by pecking wood?", "Wood Pecker")
# binding.pry
while !over
  answer = main_menu(user)
  case answer
  when 1
    review(user)
  when 2
    make_a_new_card(user)
  when 3
    update_or_delete_a_card(user)
  when 4
    puts "Goodbye #{user.name}".colorize(:green)
    over = true
  when 5
    puts "User stats\nName: #{user.name}\nTotal Questions Taken: #{user.total_taken}\nTotal Answered Correctly: #{user.total_correct}\n& #{user.get_percentage}"
  when 6
    answer_random(user)
  else
    puts "Invalid answer.".colorize(:red)
    answer = main_menu(user)
  end
end

