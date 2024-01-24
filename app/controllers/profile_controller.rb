class ProfileController < ApplicationController
    before_action :authorize_request

    def viewprofile
        
        user = User.find_by(id:@current_user.id)

        if @current_user.role=='admin'
            render json: user
        end

        if @current_user.role=='student'
            render json: user, include: ['student.admin']
        end

        if @current_user.role=='teacher'
            render json: user, include: ['teacher.admin']
        end
        
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
