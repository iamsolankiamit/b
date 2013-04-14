AssetSync.configure do |config|
  config.fog_provider = 'AWS'
  config.aws_access_key_id = 'AKIAJ45A74WK4Y7UABNA'
  config.aws_secret_access_key = 'Qz5/kkgkHS73xfakQDfFuVUnN82u9RFr0/CPddWb'
  config.fog_directory = 'roomnhouse-assets'
  
  # Increase upload performance by configuring your region
  config.fog_region = 'ap-southeast-1'
  #
  # Don't delete files from the store
  # config.existing_remote_files = "keep"
  #
  # Automatically replace files with their equivalent gzip compressed version
  # config.gzip_compression = true
  #
  # Use the Rails generated 'manifest.yml' file to produce the list of files to 
  # upload instead of searching the assets directory.
  # config.manifest = true
  #
  # Fail silently.  Useful for environments such as Heroku
  config.fail_silently = true
end
