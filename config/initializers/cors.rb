# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'  # Update this with your frontend's origin
      resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], expose: ['Authorization']
    end
  end
  