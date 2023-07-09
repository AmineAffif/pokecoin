# Création d'utilisateurs
User.create(email: 'user1@example.com', password: 'password1', balance: 100.00)
User.create(email: 'user2@example.com', password: 'password2', balance: 200.00)

# Création de pokémons
Pokemon.create(name: 'Pikachu', image_path: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png', weight: 6, height: 4, price: 10.00, user_id: 1)
Pokemon.create(name: 'Charizard', image_path: 'https://www.pokepedia.fr/images/thumb/1/17/Dracaufeu-RFVF.png/640px-Dracaufeu-RFVF.png', weight: 90, height: 15, price: 50.00, user_id: 2)
Pokemon.create(name: 'Bulbasaur', image_path: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png', weight: 6, height: 7, price: 20.00, user_id: 1)
Pokemon.create(name: 'Squirtle', image_path: 'https://img.pokemondb.net/artwork/large/squirtle.jpg', weight: 9, height: 5, price: 15.00, user_id: 2)

# Ajout de transactions
Transaction.create(action: 'buy', user_id: 1, pokemon_id: 2)
Transaction.create(action: 'sell', user_id: 2, pokemon_id: 1)
