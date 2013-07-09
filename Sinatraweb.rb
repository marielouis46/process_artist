require 'rubygems'
require "sinatra"
require 'sinatra/reloader'

get '/forum' do
	erb :form
end

post '/form' do
	"You said'#{params[:message]}'"
end

get '/' do
	"Hello World!"
end

get "/about" do
	"My name is Marie."
end

get '/hello/:name' do
	params[:name]
end

get '/more/*' do
	params[:splat]
end

get '/secret' do
	erb :secret
end

post '/secret' do
	params[:secret].reverse
end

get '/decrypt/:secret' do
	parms[:secret].reverse
end

not_found do
	#status 404
	#not found'
	halt 404, "page not found"
end

get '/time' do
	time1 = Time.new

	"Current Time : " + time1.inspect
	#time2 = Time.now
	#"Current Time : " + time2.inspect
end