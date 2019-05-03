require "http"

system "clear"
puts "Welcome to the Dictionary App!"
puts "What word are you looking for?"
word = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")

word_definitions = response.parse

puts JSON.pretty_generate(word_definitions)