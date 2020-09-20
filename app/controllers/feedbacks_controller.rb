class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  before_action :student?, only: [:new, :create]
  before_action :feedback_show_access?, only: [:show]
  before_action :feedback_edit_access?, only: [:edit, :update, :destroy]

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    if current_user.userable_type.to_str == "Admin"
      @feedbacks = Feedback.all
    elsif current_user.userable_type.to_str == "Student"
      @feedbacks = Feedback.where(student_id: current_user.userable.id)
    else current_user.userable_type.to_str == "Teacher"
      @feedbacks = Feedback.where(teacher_id: current_user.userable.id)
    end
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @course = Course.find(params[:course_id])
    @course_section = CourseSection.find(params[:course_section_id])
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @course = Course.find(params[:course_id])
    @course_section = CourseSection.find(params[:course_section_id])
    @feedback = Feedback.new(feedback_params)
    @feedback.course_section = @course_section
    @feedback.student = current_user.userable
    @feedback.teacher = @course_section.teacher

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
      @course = @feedback.course_section.course
      @course_section = @feedback.course_section
    end

    # Only allow a list of trusted parameters through.
    def feedback_params
      params.require(:feedback).permit(:description)
    end

    def feedback_edit_access?
      @student =  @feedback.student
      if current_user.userable_type.to_str == "Student"
        if current_user.userable != @student
          flash[:notice] = "Page Restricted"
          redirect_to home_path
        end
      else
        flash[:notice] = "Page Restricted"
        redirect_to home_path
      end
    end

    def feedback_show_access?
      @teacher =  @feedback.teacher
      @student =  @feedback.student
      if current_user.userable_type.to_str == "Teacher"
        if current_user.userable != @teacher
          flash[:notice] = "Page Restricted"
          redirect_to home_path
        end
      elsif current_user.userable_type.to_str == "Student"
        if current_user.userable != @student
          flash[:notice] = "Page Restricted"
          redirect_to home_path
        end
      end
    end
end
