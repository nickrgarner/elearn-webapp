class CourseSectionsController < ApplicationController
  before_action :set_course, only: [:new, :create, :register, :index]
  before_action :course_deleted?, only: [:new, :create, :register, :index]
  before_action :admin?, only: [:new, :create]
  before_action :teacher?, only: [:register]

  # GET /course_sections
  # GET /course_sections.json
  def index
    @course_sections = @course.course_sections.select {|cs| !cs.teacher.is_deleted }
  end

  # GET /course_sections/new
  def new
    @course_section = @course.course_sections.build
  end

  # POST /course_sections
  # POST /course_sections.json
  def create
    @course_section =  @course.course_sections.new(course_section_params)
    
    respond_to do |format|
      if CourseSection.where(teacher_id: @course_section.teacher_id, course_id: @course).any?
        format.html { render :new }
        flash[:notice] = "Course section for teacher already exists."
      elsif @course_section.save
        format.html { redirect_to @course, notice: 'Course section was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course_section.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /course_sections/register
  # POST /course_sections/register.json
  def register
    @course_section =  @course.course_sections.new
    @course_section.teacher_id = current_user.userable.id
    
    respond_to do |format|
      if @course_section.save
        format.html { redirect_to @course, notice: 'Course section was successfully created.' }
        format.json { render :index, status: :created, location: @course }
      else
        format.html { redirect_to @course, notice: 'Course cannot be registered .' }
        format.json { render :index, status: :created, location: @course }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def course_section_params
      params.require(:course_section).permit(:course_id, :teacher_id)
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    def course_deleted?
      if @course.is_deleted == true
        flash[:notice] = "Page not found."
        redirect_to home_path
      end
    end
end
