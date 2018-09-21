if Rails.env == 'production'
    CarrierWave.configure do |config|
      config.fog_provider = 'fog/aws'
    config.fog_credentials = {
     provider: 'AWS',
     aws_access_key_id: ENV['ACCESS_KEY_ID'],
     aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
     region: 'ap-northeast-1'
     }
    config.fog_directory = 'timecapsule-image'
    config.asset_host = 'https://s3.ap-northeast-1.amazonaws.com/timecapsule-image'
    end
    end