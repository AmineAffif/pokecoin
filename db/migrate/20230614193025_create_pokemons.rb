class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :image_path
      t.integer :weight
      t.integer :height
      t.float :price, default: 0
      t.references :user, foreign_key: true, null: true

      t.timestamps
    end
  end
end
