#coding:utf-8

require "sinatra"
require "compass"
require "twitter"

get "/" do
  @tweets = Twitter.user_timeline("quavio")[0..5]
  puts @tweets[0].inspect
    haml :index
end

get '/stylesheets/:name.css' do
 content_type 'text/css', :charset => 'utf-8'
 sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options )
end
