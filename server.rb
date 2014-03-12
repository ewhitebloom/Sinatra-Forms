require 'sinatra'
require 'CSV'
require 'pry'

get '/' do

@articles = []

CSV.foreach('data.csv', headers: true) do |row|
  @articles << {title: row[0], url: row[1], description: row[2]}
end

  erb :index
end


get '/form' do
 erb :form
end

post '/article' do

title = params['title']
url = params['url']
description = params['description']

File.open('data.csv', 'a', headers: true) do |file|
    file.puts(title + ',' + url + ',' + description)
 end

redirect '/'

end
