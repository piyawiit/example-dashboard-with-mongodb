Rails.application.routes.draw do
  mount ApplicationApi, at: '/'
  mount GrapeSwaggerRails::Engine, at: '/documentation'
end
