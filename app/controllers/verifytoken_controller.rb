class VerifytokenController < ApplicationController

    before_action :authorize_request

    def verifytoken
        render json: {role:@current_user.role}
    end

end
