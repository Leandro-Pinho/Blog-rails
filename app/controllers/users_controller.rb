class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]

    # GET /ideas or /ideas.json
    def index
      @users = User.all
    end
  
    # GET /ideas/1 or /ideas/1.json
    def show
      
    end
  
    # GET /ideas/new
    def new
      @user = user.new
    end
  
    # GET /ideas/1/edit
    def edit
    end
  
    # POST /ideas or /ideas.json
    def create
      @user = User.new(user_params)

    end
  
    # PATCH/PUT /ideas/1 or /ideas/1.json
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to idea_url(@user), notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /ideas/1 or /ideas/1.json
    def destroy
      @user.destroy
  
      respond_to do |format|
        format.html { redirect_to ideas_url, notice: "Idea was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:name, :email, :admin)
      end
  end
  