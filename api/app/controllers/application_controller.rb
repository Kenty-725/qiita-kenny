class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
        before_action :configure_permitted_parameters, if: :devise_controller?

        def configure_permitted_parameters
                devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        end

        # def current_user
        #         @current_user = current_user.id
        #         # @current_user ||= User.find_by(tokens: request.headers['Authorization'].split[1])
        # end
end
