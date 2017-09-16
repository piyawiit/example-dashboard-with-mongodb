require "api_exception"

module AuthenticateRequest
  extend ActiveSupport::Concern

  included do
    helpers do
      def authenticate_request!
        if request.headers['AccessToken'].blank?
          raise error!({ meta: { code: RESPONSE_CODE[:forbidden], message: I18n.t('errors.bad_request'), debug_info: '' } }, RESPONSE_CODE[:forbidden])
        end
      end
    end
  end
end
