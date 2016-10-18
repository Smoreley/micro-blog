require "sinatra"
require "sinatra/activerecord"
require 'sinatra/contrib'
require "./models"
set :database, "sqlite3:userdb.sqlite3"

before do 
    @mainERB = :postfeed;
    @sideERB = :front;
end

get '/' do
	erb :layout; #, :layout => :profile
end

get '/:name' do

    case params[:name]
    when "home"
        erb :home;
    when "logout"
        session.clear
        erb :logout;
    else
        erb :Error404;
    end

end

# SIGNUP
post '/signup' do 
    # Signup some how
    
    @user = User.new(fname: params["fname"], lname: params["lname"], email: params["email"], bio: params["bio"], password: params["password"], dob: params["dob"], lastOn: params["lastOn"], admin: false, picture: params["picture"]);
    @user.save;
    
end

# LOGIN
post '/login' do 
    # Login some how

end