# config/initializers/geocoder.rb

# geocoding service (see below for supported options):
Geocoder::Configuration.lookup = :google

# to use an API key:
Geocoder::Configuration.api_key = "AIzaSyBkAow2WnTQtEsd9ww-0fwZx9J9jEpPKuI"

# geocoding service request timeout, in seconds (default 3):
Geocoder::Configuration.timeout = 15

# use HTTPS for geocoding service connections:
Geocoder::Configuration.use_https = false

# language to use (for search queries and reverse geocoding):
Geocoder::Configuration.language = :en


# use a proxy to access the service:
#Geocoder::Configuration.http_proxy  = "iit2010027:ventriloquist@172.31.1.4:8080"
#Geocoder::Configuration.https_proxy = "iit2010027:ventriloquist@172.30.1.4:8080" # only if HTTPS is needed
