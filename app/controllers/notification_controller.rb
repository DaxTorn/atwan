class NotificationController < ApplicationController

    skip_before_filter :verify_authenticity_token

    def index
        if session.key? :current_user
            @notifications = Notification.where(steamid: session[:current_user]['steamid'])
            @email = User.find_by_steamid(session[:current_user]['steamid']).email
        end
    end

    def create
        notification = Notification.new
        notification.uuid = SecureRandom.uuid
        notification.key = params[:key]
        notification.steamid = params[:steamid]
        notification.notetitle = params[:notetitle]
        notification.message = params[:message]
        notification.save

        user = User.find_by_steamid(params[:steamid])
        UserNotifier.send_notification(user, params[:notetitle]).deliver_now

        render json: {:status => 'OK'}
    end

end
