class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :teacher_deleted?, only: [:show, :edit, :update, :destroy]
  before_action :teacher_edit_access?, only: [:edit, :update]
  before_action :teacher_show_access?, only: [:show]
  before_action :teacher_index_access?, only: [:index]
  before_action :admin?, only: [:new, :create, :destroy]

  # GET /teachers
  # GET /teachers.json
  def index
    if current_user.userable_type.to_str == "Student"
      @teachers = Teacher.where(discipline_id: current_user.userable.discipline_id, is_deleted: false)
    elsif current_user.userable_type.to_str == "Admin"
      @teachers = Teacher.all.where(is_deleted: false).reorder('discipline_id')
    end
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
    @teacher.profile = Profile.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.delete_teacher
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.require(:teacher).permit(:discipline_id, profile_attributes: [:first_name, :last_name, :email, :phone_number, :address, :password, :password_confirmation])
    end

    def teacher_edit_access?
      if current_user.userable_type.to_str == "Teacher"
        if current_user.userable != @teacher
          flash[:notice] = "Page Restricted."
          redirect_to home_path
        end
      elsif current_user.userable_type.to_str == "Student"
        flash[:notice] = "Page Restricted."
        redirect_to home_path
      end
    end

    def teacher_show_access?
      if current_user.userable_type.to_str == "Teacher"
        if current_user.userable != @teacher
          flash[:notice] = "Page Restricted."
          redirect_to home_path
        end
      end
    end

    def teacher_index_access?
      if current_user.userable_type.to_str == "Teacher"
        flash[:notice] = "Page Restricted."
        redirect_to home_path
      end
    end

    def teacher_deleted?
      if @teacher.is_deleted == true
        flash[:notice] = "Page not found."
        redirect_to home_path
      end
    end
end
