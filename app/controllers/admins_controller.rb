class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update]
  before_action :admin?, only: [:show, :edit, :update]
  
  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/1/edit
  def edit
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:admin).permit(profile_attributes: [:first_name, :last_name, :email, :phone_number, :address, :password, :password_confirmation])
    end
end
