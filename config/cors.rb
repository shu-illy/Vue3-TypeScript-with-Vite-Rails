Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins [ENV["FRONT_DOMAIN"]]

    resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        expose: ['Access-Control-Allow-Origin'],
        credentials: true
  end
end