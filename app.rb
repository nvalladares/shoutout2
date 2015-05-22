require 'sinatra'
require 'sinatra/reloader'
require "csv"

get '/' do
	
	test = File.read("shouts.csv")
	 @csv = CSV.parse(test) 
	


	erb :index
end

post '/newshouts' do
	@shouts = params[:shouts]
	CSV.open('shouts.csv', 'ab') do |csv|
		csv << [@shouts]
	end	

	redirect '/'
	
end	