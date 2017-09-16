module V1Base
  extend ActiveSupport::Concern

  HEADERS_DOCS = {
    Authorization: {
      description: 'User Authorization Token',
      required: true
    }
  }.freeze

  included do
    format :json
    prefix :api
    default_format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers
    version 'v1', using: :header, vendor: API_VENDOR

    rescue_from ApiException do |e|
      render_error(e.http_status, e.error.message, e.error.debug_info)
    end

    helpers do
      def logger
        Rails.logger
      end

      def render_error(code, message, debug_info = '')
        error!(
          {
            meta: { code: code, message: message, debug_info: debug_info }
          },
          code
        )
      end

      def render_success(json, extra_meta = {})
        {
          data: json,
          meta: {
            code: RESPONSE_CODE[:success], message: 'success'
          }.merge(extra_meta)
        }
      end

      def render_nothing(extra_meta = {})
        {
          data: {},
          meta: {
            code: RESPONSE_CODE[:success], message: 'success'
          }.merge(extra_meta)
        }.to_json
      end

      def pagination_dict(object)
        {
          current_page: object.current_page,
          next_page: object.next_page || -1,
          prev_page: object.prev_page || -1,
          total_pages: object.total_pages,
          total_count: object.total_count
        }
      end
    end
  end
end
