class UserController < ApplicationController

    skip_before_filter :verify_authenticity_token

    def logout
        session.clear
        redirect_to root_url
    end

    def auth_callback
        auth = request.env['omniauth.auth']
        session[:current_user] = {:nickname => auth.info.nickname, :steamid => auth.uid}

        user = User.find_by_steamid(auth.uid)

        if user.nil?
            user = User.new
            user.nickname = auth.info.nickname
            user.name = auth.info.name
            user.password = SecureRandom.hex
            user.steamid = auth.uid
            user.save!(:validate => false)
        end

        redirect_to root_url
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:current_user] = {:nickname => @user.nickname, :steamid => @user.steamid}
            redirect_to root_url
        else
            render('user/new')
        end
    end


    def login
        md5 = Digest::MD5.new
        username = params[:username]
        password = (md5 << params[:password]).to_s
        user = User.find_by(nickname: username, password: password)
        unless user.nil?
            session[:current_user] = {:nickname => username, :steamid => user.steamid}
        end
        redirect_to root_url
    end

    private

    def user_params
        params.require(:user).permit(:nickname, :steamid, :email, :password, :password_confirmation)
    end

end
