class UserController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def logout
    session.clear
    redirect_to root_url
  end

  def auth_callback
    auth = request.env['omniauth.auth']
    session[:current_user] = { :nickname => auth.info.nickname,
                               :image => auth.info.image,
                               :uid => auth.uid }

    redirect_to root_url
  end

  def new
  end

  def create

    md5 = Digest::MD5.new

    username = params[:username]
    email = params[:email]
    steamid = params[:steamid]
    password = params[:password]
    cpassword = params[:cpassword]

    user = User.new
    user.nickname = username
    user.email = email
    user.password = md5 << password
    user.steamid = steamid
    user.save

    redirect_to root_url
  end


  def login

    md5 = Digest::MD5.new

    username =  params[:username]
    password = (md5 << params[:password]).to_s

    user = User.find_by(nickname: username, password: password)

    unless user.nil?
      session[:current_user] = { :nickname => username,
                                 :uid => user.steamid }
    end

    redirect_to root_url
  end

end
