require './config/environment'
require './app/models/tweet'
require './app/models/user'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
    end

    get '/signup' do
      erb :signup
    end

    post '/signup' do
      @user = User.create(params)
      redirect to '/tweets'
    end

    get '/tweets' do
        @users = User.all
        @tweets = Tweet.all
        erb :index
    end

    post '/tweets'do
        @tweet = Tweet.create(params)
        str = params[:status]
        parsed = str.scan(/#\w+/).flatten
        parsed.each do |tag|
          @hashtag = Hashtag.create(tag, Tweet.id)
        redirect to '/tweets'
    end

end
