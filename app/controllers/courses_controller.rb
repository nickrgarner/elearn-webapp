class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :admin?, only: [:new, :create, :edit, :update, :destroy]
  before_action :course_deleted?, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    if current_user.userable_type.to_str == "Teacher" || current_user.userable_type.to_str == "Student"
      @courses = Course.where(discipline_id: current_user.userable.discipline_id, is_deleted: false).reorder('course_number')
    else
      @courses = Course.all.where(is_deleted: false).reorder('discipline_id','course_number')
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.delete_course
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:course_number, :discipline_id, :name, :area, :price)
    end

    def course_deleted?
      if @course.is_deleted == true
        flash[:notice] = "Page not found."
        redirect_to home_path
      end
    end
end
