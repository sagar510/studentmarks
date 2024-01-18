class ProfileController < ApplicationController
    before_action :authorize_request

    def viewprofile

        @data

        if @current_user.role=='admin'
            @data = User.joins(:admin).select(:id,:admin_name,:email,:role).find_by(id:@current_user.id)
        end

        if @current_user.role=='student'
            @data = User.joins(:student).select(:id,:student_name,:email,:admin_id,:role).find_by(id:@current_user.id)
        end

        if @current_user.role=='teacher'
            @data = User.joins(teacher: :admin).select(:id,:teacher_name,:email,:admin_name,:role).find_by(id:@current_user.id)
        end

        puts {@data}

        render json: @data
        
    end

    def updateprofile

        @member

        if @current_user.role=='admin'
           @member = Admin.find_by(user_id:@current_user.id) 
           @member.admin_name = params["name"]
        end

        if @current_user.role=='student'
            @member = Student.find_by(user_id:@current_user.id)
            @member.student_name = params["name"]
        end

        if @current_user.role=='teacher'
            @member = Teacher.find_by(user_id:@current_user.id)
            @member.teacher_name = params["name"]
        end

        if @member.save
            render json: {message:"Saved Sucessfully"}
        end
    
    end
end
