class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :admin_user, only: :destroy 

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @keys = Keychain.all
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def logged_in_user
	unless logged_in?   #if the user is logged in, they are allowed to proceed
		flash[:danger] = “Please log in”  #otherwise, redirect them to the login
		redirect_to login_url      #page and ask them to log in
	end
end
  
  def admin_user
	redirect_to(root_url) unless current_user.admin?
end


def correct_user
   	@user = User.find(params[:id])  #retrieve the id of the user
	redirect_to(root_url) unless @user == current_user  #if it is the id of the #current_user, let them in, otherwise, redirect them to the root url
end


  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
@user = User.find(params[:id])
if @user.update_attributes(user_params)
  flash[:success] = "Profile updated"
  redirect_to @user
else
   flash.now[:danger] = 'Please try again…'
    render 'edit'
end
       end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :answer, :question)
    end
end
