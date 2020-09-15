class CreditCardsController < ApplicationController
  before_action :set_credit_card, only: [:show, :edit, :update, :destroy]

  # GET /credit_cards/1
  # GET /credit_cards/1.json
  def show
  end

  # GET /credit_cards/new
  def new
    @student = Student.find(params[:student_id])
    @credit_card = CreditCard.new(student_id: @student.id)
  end

  # GET /credit_cards/1/edit
  def edit
  end

  # POST /credit_cards
  # POST /credit_cards.json
  def create
    @student = Student.find(params[:student_id])
    params[:credit_card][:expiration_date] = "#{params[:credit_card][:expiration_date]}-01".to_date
    @credit_card = CreditCard.new(credit_card_params)
    @credit_card.student = @student
    respond_to do |format|
      if @credit_card.save
        format.html { redirect_to @student, notice: 'Credit card was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @credit_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_cards/1
  # PATCH/PUT /credit_cards/1.json
  def update
    params[:credit_card][:expiration_date] = "#{params[:credit_card][:expiration_date]}-01".to_date
    puts params
    respond_to do |format|
      if @credit_card.update(credit_card_params)
        format.html { redirect_to @student, notice: 'Credit card was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @credit_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_cards/1
  # DELETE /credit_cards/1.json
  def destroy
    @credit_card.destroy
    respond_to do |format|
      format.html { redirect_to student_path(@student), notice: 'Credit card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_card
      @student = Student.find(params[:student_id])
      @credit_card = @student.credit_card
    end

    # Only allow a list of trusted parameters through.
    def credit_card_params
      params.require(:credit_card).permit(:student_id, :name, :card_number, :expiration_date, :cvv)
    end
end
