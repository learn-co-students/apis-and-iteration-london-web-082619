require 'rest-client'
require 'json'
require 'pry'

def get_api_response(url)
  response_string = RestClient.get(url)
  JSON.parse(response_string)
end

def get_movie_data(character_movies)
  #returns array of movie data 
  character_movies.map() { | movie | get_api_response(movie) } 
end

def get_character_movies_from_api(character_name)
  response_hash = get_api_response('http://www.swapi.co/api/people/')
  response_hash["results"].each do |character|
    if character["name"] == character_name
      films = character["films"] #returns array of film urls
    end
  end
  get_movie_data(films)
end

def print_movies(films)
  #passes in array of movie data, returns array of movie titles
  films.each() { | hash | puts hash["title"] }
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end