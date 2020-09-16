class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :add_to_cart, :remove_from_cart]

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  def add_to_cart
    course_section = CourseSection.find(params[:course_section_id])
    if @cart.cart_objects.where(course_section_id: course_section.id).any?
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

  def checkout

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
end
