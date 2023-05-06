# config/initializers/active_storage.rb
Rails.application.config.active_storage.service_urls_expire_in = 1.hour

if Rails.env.production?
  Rails.application.config.active_storage.service = :amazon
  Rails.application.config.active_storage.service_config = {
    service: 'S3',
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_REGION'],
    bucket: ENV['S3_BUCKET_NAME']
  }
else
  Rails.application.config.active_storage.service = :local
end

