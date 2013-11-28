class AddOrderIdToLineitems < ActiveRecord::Migration
  def change
    add_column :lineitems, :order_id, :integer
    add_column :lineitems, :product_id, :integer
  end
end
