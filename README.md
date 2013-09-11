# Installation Guide:
For ubuntu:

Clone the repo:
  git clone https://github.com/onerakeshone/roomnhouse.git

install pg 9.1.9

Get info about it on:
  http://packages.ubuntu.com/precise/postgresql-9.1

you will also have to install 
  postgresql-contrib libpq-dev

after installtion
  sudo -u postgres createuser --superuser fash
  sudo -u postgres psql postgres

next you will be in psql console
  postgres=# \passsword fash

  then type "amits0lank!" as the password

  createdb fash
  \q

/etc/postgresql//main/postgresql.conf:
listen_addresses = 'localhost'

/etc/postgresql//main/pg_hba.conf:
"local" is for Unix domain socket connections only
local   all         all                               md5

sudo /etc/init.d/postgresql start

===========================================

run
  bundle install

  rake db:migrate
  rake db:seed // make sure you are not using proxies, else seed wont work.

config/database.yml
add line 
  host: localhost

start the rails server
