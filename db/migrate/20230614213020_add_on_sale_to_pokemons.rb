class AddOnSaleToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :on_sale, :boolean, default: false
  end
end
