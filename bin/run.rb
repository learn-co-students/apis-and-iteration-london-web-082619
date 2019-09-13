# #!/usr/bin/env ruby

# require_relative "../lib/api_communicator.rb"
# require_relative "../lib/command_line_interface.rb"

# welcome
# character = get_character_from_user
# show_character_movies(character)


require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
binding.pry
character = get_character_from_user
# get_character_movies_from_api(character)
show_character_movies(character)

character_data = RestClient.get('http://www.swapi.co/api/people/')
response_hash = JSON.parse(character_data)

puts response_hash.results