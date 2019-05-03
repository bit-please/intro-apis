require "http"

system "clear"
puts "Welcome to the Dictionary App!"
puts "What word are you looking for?"
word = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=d1468251dcc15bd72245101c1fc07fae5c3747257092d3230")

word_definitions = response.parse

puts "Definitions: "
i = 1
word_definitions.each do |definition|
	puts "#{i}. #{definition["text"]}"
	i += 1
end

# first_definition = word_definitions[0]["text"]

# puts "Definition: #{first_definition}"

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=d1468251dcc15bd72245101c1fc07fae5c3747257092d3230")

top_example = response.parse

top_example_text = top_example["text"]

puts "Top Example: #{top_example_text}"

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=d1468251dcc15bd72245101c1fc07fae5c3747257092d3230")

pronunciations = response.parse

first_pronunciation = pronunciations[0]["raw"]

puts "Top Pronunciation: #{first_pronunciation}"

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/audio?useCanonical=false&limit=50&api_key=d1468251dcc15bd72245101c1fc07fae5c3747257092d3230")

audios = response.parse

file_url = audios[0]["fileUrl"]

`open #{file_url}`