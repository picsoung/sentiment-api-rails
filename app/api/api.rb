class API < Grape::API
  prefix 'api'
  mount Sentiment::Ress
end
