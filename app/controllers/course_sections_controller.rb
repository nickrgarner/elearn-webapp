class CourseSectionsController < ApplicationController
  before_action :set_course_section, only: [:show, :edit, :update, :destroy]

  # GET /course_sections
  # GET /course_sections.json
  def index
    @course = Course.find(params[:course_id])
    @course_sections = @course.course_sections.all
  end

  # GET /course_sections/new
  def new
    @course = Course.find(params[:course_id])
    @course_section = @course.course_sections.build
  end

  # POST /course_sections
  # POST /course_sections.json
  def create
    @course = Course.find(params[:course_id])
    @course_section =  @course.course_sections.create(course_section_params)

    respond_to do |format|
      if @course_section.save
        format.html { redirect_to @course, notice: 'Course section was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course_section.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_section
      @course_section = CourseSection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_section_params
      params.require(:course_section).permit(:course_id, :teacher_id)
    end
end
