require 'rest-client'
require 'json'

response = RestClient.get "https://api.themoviedb.org/3/movie/top_rated?api_key=72e647f623a0a47d72034f2c64b4878e"
repos = JSON.parse(response)['results'].first(15)
repos.each do |movie|
  Movie.create(title: movie['title'],
               overview: movie['overview'],
               poster_url: "https://image.tmdb.org/t/p/w400/#{movie['poster_path']}",
               rating: movie['vote_average'])
end
