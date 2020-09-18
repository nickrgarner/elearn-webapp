class PurchaseHistoriesController < ApplicationController
  
  # GET /purchase_histories/1
  # GET /purchase_histories/1.json
  def show
    @purchases = PurchaseHistory.where(student_id: current_user.userable.id)
  end

end
