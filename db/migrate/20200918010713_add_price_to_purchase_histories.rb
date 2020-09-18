class AddPriceToPurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    add_column :purchase_histories, :price, :float
  end
end
