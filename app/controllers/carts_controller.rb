class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :addtocart, :removefromcart]

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # # POST /carts
  # # POST /carts.json
  # def create
  #   @cart = Cart.new(cart_params)

  #   respond_to do |format|
  #     if @cart.save
  #       format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
  #       format.json { render :show, status: :created, location: @cart }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @cart.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /carts/1
  # # DELETE /carts/1.json
  # def destroy
  #   @cart.destroy
  #   respond_to do |format|
  #     format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  def addtocart
    course_section = CourseSection.find(params[:course_section_id])
    if @cart.cart_objects.where(course_section_id: course_section.id).any?
      flash[:notice] = "Item already added to cart"
    else
      @cart.cart_objects.create(course_section_id: course_section.id)
      flash[:notice] = "Item added to cart"
    end
  end

  def removefromcart
    course_section = CourseSection.find(params[:course_section_id])
    cart_object = @cart.cart_objects.find_by(course_section_id: course_section.id)
    if cart_object
      cart_object.destroy
      flash[:notice] = "Item removed from cart"
    else
      flash[:notice] = "Item does not exist in cart"
    end
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
      params.require(:course_section)
    end
end
