#coding:utf-8
require "sinatra"
require "compass"
require "twitter"
require 'rack-flash'
require 'pony'

enable :sessions
use Rack::Flash

get "/" do
  @tweets = Twitter.user_timeline("quavio")[0..5]
  puts @tweets[0].inspect
    haml :index
end

post "/" do
  if(params[:nome] != "Nome" && params[:email] != "E-mail" && params[:mensagem] != "Mensagem")
    Pony.mail(:to => 'tomas@quavio.com.br', :via => :smtp, :subject => "Contato via site", :html_body => haml(:email), :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => 'noreplysite@quavio.com.br',
      :password             => '20110310',
      :authentication       => :plain,
      :domain               => "quavio.com.br"
    })
    flash[:notice] = "Maravilha, logo entraremos em contato! Abraços!"
  else
    flash[:alert] = "Ooops.. Por favor, preencha todos os campos, obrigado!"
  end
  redirect "/#servicos_contato"
end

get "/email" do
  params[:nome] = "Nícolas"
  params[:email] = "nicolas@quavio.com.br"
  params[:mensagem] = "Teste de e-mail 1, 2, 3..."
  haml :email
end

get '/stylesheets/:name.css' do
 content_type 'text/css', :charset => 'utf-8'
 sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options )
end
