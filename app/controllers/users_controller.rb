class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end
  
  #POST /users
  #POST /users.json

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver_now

        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created,
                      location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status:
                      :unprocessable_entity }
      end
    end
  end

  def show
    #populate @user_bookmarks with the user's bookmarks
    #populate @like_bookmarks with liked bookmarks

  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
