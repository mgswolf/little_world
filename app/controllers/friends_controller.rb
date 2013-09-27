class FriendsController < ApplicationController
  before_filter :get_friend, :except => [:index, :new, :create]

  def index
    @friends = Friend.all
  end

  def show
    @closest_friends = Friend.closests(@friend)
  end

  def new
    @friend = Friend.new
  end

  def edit

  end

  def create
    @friend = Friend.new(friend_params)
    if @friend.save
      redirect_to @friend, :notice => t('flash.friends.create.notice')
    else
      flash.alert = t('flash.friends.create.alert')
      render :new
    end
  end

  def update
    if @friend.update(friend_params)
      redirect_to @friend, :notice => t('flash.friends.update.notice')
    else
      flash.alert = t('flash.friends.update.alert')
      render :edit
    end
  end

  def destroy
    if @friend.destroy
      redirect_to friends_path, :notice => t('flash.friends.destroy.notice')
    else
      redirect_to @friend, :alert => t('flash.friends.destroy.alert')
    end
  end

  private

  def friend_params
    params.require(:friend).permit(:name, :latitude, :longitude)
  end

  def get_friend
    @friend = Friend.find(params[:id])
  end

end