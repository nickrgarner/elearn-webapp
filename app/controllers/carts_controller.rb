class CartsController < ApplicationController
  before_action :set_cart, only: [:index, :add_to_cart, :remove_from_cart, :checkout, :clear]
  before_action :cart_access?, only: [:index, :add_to_cart, :remove_from_cart, :clear]
  before_action :admin?, only: [:new, :create]
  before_action :cart_checkout_access?, only: [:checkout]

  # GET /carts
  # GET /carts.json
  def index
  end

  # GET /carts/new
  def new
    @course_section = CourseSection.find(params[:course_section_id])
  end

  # POST /carts
  # POST /carts.json
  def create 
    @student = Student.find(params[:student_id])
    @course_section =  CourseSection.find(params[:course_section_id])
    cart = @student.cart 
    respond_to do |format|
      if PurchaseHistory.where(student_id: @student, course_section_id: @course_section.id).any?
        format.html { render :new }
        flash[:notice] = "Course already purchased by student."
      elsif cart.cart_objects.where(course_section_id: @course_section.id).any?
        format.html { render :new }
        flash[:notice] = "Item already added to cart."
      else
        cart.cart_objects.create(course_section_id: @course_section.id)
        format.html { redirect_to courses_path, notice: 'Item added to cart.' }
        format.json { render :show, status: :created, location: courses_path }
      end
    end
  end

  def add_to_cart
    course_section = CourseSection.find(params[:course_section_id])
    if PurchaseHistory.where(student_id: @student, course_section_id: course_section.id).any?
      flash[:notice] = "Course already purchased."
    elsif @cart.cart_objects.where(course_section_id: course_section.id).any?
      flash[:notice] = "Item already added to cart."
    else
      @cart.cart_objects.create(course_section_id: course_section.id)
      flash[:notice] = "Item added to cart"
    end
    redirect_to params[:link]
  end

  def remove_from_cart
    course_section = CourseSection.find(params[:course_section_id])
    cart_object = @cart.cart_objects.find_by(course_section_id: course_section.id)
    if cart_object
      cart_object.destroy
      flash[:notice] = "Item removed from cart"
    else
      flash[:notice] = "Item does not exist in cart"
    end
    redirect_to params[:link]
  end

  def checkout
    @cart.cart_objects.each do |cart_object|
      PurchaseHistory.create(student_id: current_user.userable.id, course_section_id: cart_object.course_section.id,
          price: cart_object.course_section.course.price)
      cart_object.destroy
    end
    flash[:notice] = "Purchase successful."
    redirect_to params[:link]
  end

  def clear
    @cart.cart_objects.each do |cart_object|
      cart_object.destroy
    end
    flash[:notice] = "Items removed."
    redirect_to params[:link]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @student = Student.find(params[:student_id])
      @cart = @student.cart
    end
    
    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:course_section).permit(:link, :student_id)
    end
    
    def cart_access?
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

    def cart_checkout_access?
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
end
