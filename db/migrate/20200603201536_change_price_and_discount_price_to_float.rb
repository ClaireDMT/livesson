class ChangePriceAndDiscountPriceToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :lessons, :lesson_price, :float
    change_column :lessons, :lesson_discount_price, :float
  end
end
