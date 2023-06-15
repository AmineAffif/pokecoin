# Création d'utilisateurs
User.create(email: 'user1@example.com', password: 'password1', balance: 100.00)
User.create(email: 'user2@example.com', password: 'password2', balance: 200.00)

# Création de pokémons
Pokemon.create(name: 'Pikachu', image_path: 'pikachu.png', weight: 6, height: 4, price: 10.00, user_id: 1)
Pokemon.create(name: 'Charizard', image_path: 'charizard.png', weight: 90, height: 15, price: 50.00, user_id: 2)
Pokemon.create(name: 'Bulbasaur', image_path: 'bulbasaur.png', weight: 6, height: 7, price: 20.00, user_id: 1)
Pokemon.create(name: 'Squirtle', image_path: 'squirtle.png', weight: 9, height: 5, price: 15.00, user_id: 2)

# Ajout de transactions
Transaction.create(action: 'buy', user_id: 1, pokemon_id: 2)
Transaction.create(action: 'sell', user_id: 2, pokemon_id: 1)
