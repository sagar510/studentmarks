class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    @current_user

    def authorize_request
        header = request.headers['Authorization']
        token = header.split(' ').last if header.present?

        begin
            decoded = JWT.decode(token,ENV['JWT_SECRET_KEY'],true,algorithm: 'HS256')
            @current_user = User.find(decoded.first['user_id'])
        rescue JWT::DecodeError
            render json: {error: 'Unauthorizeds'},status: :unauthorized
        end
    end

    def authorize_admin
        unless @current_user.role=='admin'
            render json: {error: 'Unauthorized Insufficient role'},status: :unauthorized
            return
        end
    end

    def authorize_student
        unless @current_user.role=='student'
            render json: {error: 'Unauthorized Insufficient role'},status: :unauthorized
            return
        end
    end

    def authorize_teacher
        unless @current_user.role=='teacher'
            render json: {error: 'Unauthorized Insufficient role'},status: :unauthorized
            return
        end
    end

end
