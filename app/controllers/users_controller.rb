class UsersController < ApplicationController

    before_action :authorize_request, except: [:authenticate]

    def authenticate
        user = User.find_by(email:params[:email])

        if user&.authenticate(params[:password])
            token = generate_token(user.id,user.email,user.role)
            response.headers['Authorization']="#{token}"
            render json: {token: token}
        else
            render json: {error:'Invalid user or password'},status: :unauthorized
        end
    end

    def update_password
        puts "Hello"
        puts "Current Password: #{params[:password]}"
        puts "#{@current_user.id}"
        if @current_user&.authenticate(params[:password])
          puts "Hello2"
          if @current_user.update(password: params[:new_password])
            render json: { message: 'Password updated successfully' }
          else
            render json: { error: @current_user.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: 'Current password is incorrect' }, status: :unauthorized
        end
    end

    private

    def generate_token(user_id,email,role)
        payload = {
            user_id: user_id,
            email:email,
            role:role
        }
        JWT.encode(payload,ENV['JWT_SECRET_KEY'],'HS256')
    end

end


