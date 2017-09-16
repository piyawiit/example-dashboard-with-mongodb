API_VENDOR = "example_dashboard_with_mongodb".freeze

RESPONSE_CODE = {
  success: 200,
  bad_request: 400,
  unauthorized: 401,
  forbidden: 403,
  not_found: 404,
  unprocessable_entity: 422,
  internal_server_error: 500,
  common_error: 1001
}.freeze

PER_PAGE = 20
PER_PAGE_MODERATE = 1
