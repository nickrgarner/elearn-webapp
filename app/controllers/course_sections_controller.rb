class CourseSectionsController < ApplicationController
  # GET /course_sections
  # GET /course_sections.json
  before_action :admin?, only: [:new, :create]
  before_action :teacher?, only: [:register]

  def index
    @course = Course.find(params[:course_id])
    @course_sections = @course.course_sections.all
  end

  # GET /course_sections/new
  def new
    @course = Course.find(params[:course_id])
    @course_section = @course.course_sections.build
    if(current_user.userable_type.to_str == "Teacher")
      @course_section.teacher_id = current_user.userable.id
    end
  end

  # POST /course_sections
  # POST /course_sections.json
  def create
    @course = Course.find(params[:course_id])
    @course_section =  @course.course_sections.new(course_section_params)
    
    respond_to do |format|
      if CourseSection.where(teacher_id: @course_section.teacher_id).any?
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
    @course = Course.find(params[:course_id])
    @course_section =  @course.course_sections.new
    @course_section.teacher_id = current_user.userable.id
    
    respond_to do |format|
      if @course_section.save
        format.html { redirect_to @course, notice: 'Course section was registerd created.' }
        format.json { render :index, status: :created, location: @course }
      else
        format.html { redirect_to @course, notice: 'Course cannot be registerd .' }
        format.json { render :index, status: :created, location: @course }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def course_section_params
      params.require(:course_section).permit(:course_id, :teacher_id)
    end
end
