class PurchaseHistoriesController < ApplicationController
  before_action :purchase_index_access?, only: [:index]
  # GET /purchase_histories
  # GET /purchase_histories.json
  def index
    if current_user.userable_type.to_str  == "Student"
      @purchases = PurchaseHistory.where(student_id: current_user.userable.id)
    elsif current_user.userable_type.to_str  == "Admin"
      @purchases = PurchaseHistory.all
    end
  end

  private
    def purchase_index_access?
      if current_user.userable_type.to_str == "Teacher"
        flash[:notice] = "Page Restricted"
        redirect_to home_path
      end
    end
end
