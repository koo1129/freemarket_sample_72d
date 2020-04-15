require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    
    config.fog_provider = 'fog/aws'
    #本番環境のS3アクセスキーを環境変数から取得します
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region: 'ap-northeast-1'
      }
    
    #本番環境のS3ホストを記入して下さい
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/google-storage'
    config.fog_directory  = 'google-storage'
    config.fog_public = true
    config.fog_provider = 'fog/aws'
    else
      config.storage :file # 開発環境:public/uploades下に保存
      config.enable_processing = false if Rails.env.test? #test:処理をスキップ
    end

end