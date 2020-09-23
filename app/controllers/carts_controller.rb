class CartsController < ApplicationController
  before_action :authorized?, only: [:index, :add_to_cart, :remove_from_cart, :checkout, :OTP]
  require 'securerandom'
  # GET /carts
  # GET /carts.json
  def index
  end

  def add_to_cart
    course_section = CourseSection.find(params[:course_section_id])
    if PurchaseHistory.where(student_id: current_user.userable.id, course_section_id: course_section.id).any?
      flash[:notice] = "Course already purchased"
    elsif @cart.cart_objects.where(course_section_id: course_section.id).any?
      flash[:notice] = "Item already added to cart"
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

  def OTP
    @@key = SecureRandom.hex(5)
    UserMailer.with(user: @current_user, key: @@key, course_section_id: 0, link: student_carts_path(current_user.userable)).OTP_email.deliver_now
    flash[:alert] = "We've emailed you your One Time Password"
  end

  def checkout
    if @@key == params[:OTP]
      @cart.cart_objects.each do |cart_object|
        UserMailer.with(user: @current_user,course: Course.find(cart_object.course_section.course_id)).registration_email.deliver_now
        UserMailer.with(user: Teacher.find(cart_object.course_section.teacher_id),course: Course.find(cart_object.course_section.course_id)).new_student_email.deliver_now
        PurchaseHistory.create(student_id: current_user.userable.id, course_section_id: cart_object.course_section.id,
            price: cart_object.course_section.course.price)
        cart_object.destroy
      end
      flash[:notice] = "Purchase successful."
      redirect_to student_carts_path(current_user.userable)
    else
      flash[:alert] = "Incorrect OTP, try again"
      render "OTP"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = current_user.userable.cart
    end
    
    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:course_section, :link)
    end
    
    def authorized?
      @student = Student.find(params[:student_id])
      if current_user.userable_type.to_str == "Student"
        if current_user.userable != @student
          flash[:notice] = "Page Restricted"
          redirect_to home_path
        else
          set_cart
        end
      else
        flash[:notice] = "Page Restricted"
        redirect_to home_path
      end
    end
end
