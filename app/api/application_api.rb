class ApplicationApi < Grape::API
  mount V1::Base

  add_swagger_documentation(
    base_path: '/',
    hide_documentation_path: true
  )
end
