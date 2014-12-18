class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.money :price, currency: { present: false }
      t.money :amount, currency: { present: false }

      t.timestamps
    end
  end
end
