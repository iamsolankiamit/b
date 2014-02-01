web: bundle exec passenger start -p $PORT --max-pool-size 3
worker: rake jobs:work
worker: rake paperclip:refresh CLASS=Photo
