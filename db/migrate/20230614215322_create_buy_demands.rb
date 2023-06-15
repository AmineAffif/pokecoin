class CreateBuyDemands < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_demands do |t|
      t.references :buyer, null: false, foreign_key: { to_table: :users }
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
