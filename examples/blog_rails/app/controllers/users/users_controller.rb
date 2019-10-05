class Users::UsersController < ApplicationController
  before_action :set_users_user, only: [:show, :edit, :update, :destroy]

  # GET /users/users
  # GET /users/users.json
  def index
    @users_users = Domain[Users: :User].all
  end

  # GET /users/users/1
  # GET /users/users/1.json
  def show
  end

  # GET /users/users/new
  def new
    @users_user = Domain[Users: :User].build(name: nil)
  end

  # GET /users/users/1/edit
  def edit
  end

  # POST /users/users
  # POST /users/users.json
  def create
    @users_user = Domain[Users: :User].build(users_user_params.to_h.symbolize_keys)

    respond_to do |format|
      if Domain[@users_user].save
        format.html { redirect_to @users_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @users_user }
      else
        format.html { render :new }
        format.json { render json: @users_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/users/1
  # PATCH/PUT /users/users/1.json
  def update
    respond_to do |format|
      if @users_user.update(users_user_params)
        format.html { redirect_to @users_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_user }
      else
        format.html { render :edit }
        format.json { render json: @users_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/users/1
  # DELETE /users/users/1.json
  def destroy
    @users_user.destroy
    respond_to do |format|
      format.html { redirect_to users_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_user
      @users_user = Users::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_user_params
      params.require(:users_user).permit(:name)
    end
end
