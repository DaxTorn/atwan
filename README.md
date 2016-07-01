##ARK Trip Wire Alarm Notification


####How to install

#####Requirements

To install this app you need the fallowing to be installed on your server :
* Ruby with rails and bundler
* Bower
* The database of your choice 
* A Steam API Key, If you don't have, you can request one  [Here](https://steamcommunity.com/dev/apikey)

#####Installation


1) Clone the repository


```
git clone git@github.com:adenaud/atwan.git
```

2) Configure your database : in the ```config```  create a ```database.yml``` file with this content :

```
default: &default
    adapter: postgresql
    pool: 5
    timeout: 5000
    host: localhost
    username: <username>
    password: <password>
    database: <database>
    
development:
  <<: *default

test:
  <<: *default

production:
  <<: *default
```

Replace the ```adapter```, ```host```, ```username```, ```password``` and ```database``` fields with your database settings.
This is the most basic configuration file, feel free to change it depending of your needs. 

This project is developed with Postgres, if you choose to use an other DBMS you have to change the ```adapter``` field.

The ```adapter``` field correspond to the DBMS driver to use, it could be  ```postgresql```, ```sqlite3``` or ```mysql2```, for more details refer to the [Configuring a Database](http://edgeguides.rubyonrails.org/configuring.html#configuring-a-database) chapter of the Rails documentation.
You also have to change the gem to use in the ```Gemfile```.

Once your database is properly configured type ```rake db:migrate``` to generate the tables.

3) Configure your application settings : in the ```config```  create a ```application.yml``` and fill it with your API Key and a secret key.

```
STEAM_WEB_API_KEY: 'stem_api_key'
SECRET_KEY_BASE: 'secret_tocker'
```
The secret key ise used by Rails it self, to generate one run ```rake secret```.

4) Install the gems :

```
bundle install
```

5) Install the Javascript and CSS assets :

```
bower install
RAILS_ENV=production bin/rake assets:precompile
```

6) Run the app :
Simply run the app with the ```rails server -b 0.0.0.0 -p 3000 -e development``` command.
If you want to deploy the app on Apache, Passenger, CPanel or other refers to the corresponding documentation.