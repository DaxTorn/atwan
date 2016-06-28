class NotificationController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    @notifications = Notification.all
  end

  def create

    notification = Notification.new
    notification.uuid = SecureRandom.uuid
    notification.key = params[:key]
    notification.steamid = params[:steamid]
    notification.notetitle = params[:notetitle]
    notification.message = params[:message]
    notification.save

    render json: {:status => 'OK'}
  end
end
