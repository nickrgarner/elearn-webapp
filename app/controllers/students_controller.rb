class StudentsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :student_edit_access?, only: [:edit, :update]
  before_action :student_show_access?, only: [:show]
  before_action :student_index_access?, only: [:index]
  before_action :student_create_access?, only: [:new,:create]
  before_action :admin?, only: [:destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    @student.profile = Profile.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    #removed student. before cart below
    @cart = Cart.new(student_id: @student.id)
    @cart.cart_objects.build

    respond_to do |format|
      if @student.save
        @cart.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:discipline_id, profile_attributes: [:first_name, :last_name, :email, :phone_number, :address, :password, :password_confirmation])
    end

    def student_edit_access?
      if current_user.userable_type.to_str == "Student"
        if current_user.userable != @student
          flash[:notice] = "Page Restricted"
          redirect_to home_path
        end
      elsif current_user.userable_type.to_str == "Teacher"
        flash[:notice] = "Page Restricted"
        redirect_to home_path
      end
    end

    def student_show_access?
      if current_user.userable_type.to_str == "Student"
        if current_user.userable != @student
          flash[:notice] = "Page Restricted"
          redirect_to home_path
        end
      end
    end

    def student_index_access?
      if current_user.userable_type.to_str != "Admin"
        flash[:notice] = "Page Restricted"
        redirect_to home_path
      end
    end

    def student_create_access?
      if current_user.nil?
      elsif current_user.userable_type.to_str != "Admin"
        flash[:notice] = "Page Restricted"
        redirect_to home_path
      end
    end
end
