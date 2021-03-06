Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :realty
      get 'realty/images/:id', to: 'realty#images', as: 'images'
    end
  end
end
