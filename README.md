**🏠 Page d'accueil**

![image](https://github.com/AmineAffif/pokecoin/assets/45182137/423f2254-de7a-44c9-aaa2-66ed32882a41)

**👁 Show**

![image](https://github.com/AmineAffif/pokecoin/assets/45182137/4a3c143f-8871-4d2d-a9a8-48443a189753)

**👁 Show**

![image](https://github.com/AmineAffif/pokecoin/assets/45182137/3c65cdee-1f01-4743-90a0-3fd322d63f77)

**🤝 index demandes d'achat**

![image](https://github.com/AmineAffif/pokecoin/assets/45182137/c13420bf-2649-4560-b2e1-bccf0094d3d1)

**🙍‍♂ Mon profil**

![image](https://github.com/AmineAffif/pokecoin/assets/45182137/aea5c919-63b9-465b-9c88-c4a07ebe7b39)


### Lancement du projet Rails
```ruby
bundle
```

```ruby
rails db:seed
```

```ruby
rails s
```

### Lancement du projet avec Docker
```bash
docker build -t monimagerails .
```

```bash
docker run -p 3000:3000 -v $(pwd):/app monimagerails
```

```bash
docker ps
```
copier le PID obtenu

```bash
docker exec -it PID_OBTENU bash -c "rails db:migrate db:seed"
```
