# config/initializers/carrierwave.rb
# This file is not created by default so you might have to create it yourself.
CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                                 # required
    config.fog_credentials = {
      :provider               => ENV["PROVIDER"],                   # required
      :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],          # required
      :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"],      # required
      :region                 => ENV["AWS_REGION"]                  # optional, defaults to 'us-east-1'
    }
    
    


  
  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
     config.storage = :file
  else
     config.storage = :fog
  end
  
  #config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_directory  = ENV["AWS_BUCKET_NAME"]                  # required
  #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  #config.storage = :fog
    
  
end