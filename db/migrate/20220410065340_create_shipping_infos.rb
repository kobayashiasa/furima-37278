class CreateShippingInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_infos do |t|

      t.timestamps
    end
  end
end
