CarrierWave.configure do |config|
  if Rails.env.production? 
    config.storage :fog                       
    config.fog_credentials = {
      provider:              'AWS',                        
      aws_access_key_id:     ENV['carrier_wave_aws_access_key_id'],      # 你的 key           
      aws_secret_access_key: ENV['carrier_wave_aws_secret_access_key'],      # 你的 secret key         
      region:                'us-east-1' # 你的 S3 bucket 的 Region 位置   

    }
    config.fog_directory  = 'travelfuntaiwan' # 你設定的 bucket name 

  else
    config.storage :file
  end
end