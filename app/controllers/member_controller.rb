class MemberController < ApplicationController

    before_action :authorize_request,:authorize_admin

    def createuserandmember
        youradmin = Admin.find_by(user_id:@current_user.id)
        user = User.new(email:params["email"],password:params["password"],role:params["role"])
    
        if user.save
            
            if user.role == 'admin'
                adm = Admin.create!(admin_name:params["name"],user_id:user.id)

                if adm.save
                    render json:{message:'User created sucessfully'}, status: :created
                else
                    render json:{error: adm.errors.full_messages.join(',')},status: :bad_request
                end  
            end 
            
            if user.role == 'student'
                st = Student.create!(student_name:params["name"],user_id:user.id,admin_id:youradmin.id)

                if st.save
                    render json:{message:'User created sucessfully'}, status: :created
                else
                    render json:{error: st.errors.full_messages.join(',')},status: :bad_request
                end  
            end         
            
            if user.role == 'teacher'
                tchr = Teacher.create!(teacher_name:params["name"],user_id:user.id,admin_id:youradmin.id)

                if tchr.save
                    render json:{message:'User created sucessfully'}, status: :created
                else
                    render json:{error: st.errors.full_messages.join(',')},status: :bad_request
                end  
            end  

        else
            render json:{error: user.errors.full_messages.join(',')},status: :bad_request
        end
    end

    def viewmembers
        #@data = Student.select(:id,:student_name,:admin_id)
        #@data = User.joins(:student).select(:id,:student_name,:email,:admin_id)
        #@data = User.joins(:student)
        @data1 = User.joins(student: :admin).select(:id,:student_name,:email,:admin_name)
        @data2 = User.joins(teacher: :admin).select(:id,:teacher_name,:email,:admin_name)
        @data3 = User.joins(:admin).select(:id,:admin_name,:email)
        render json: {"student":@data1,"teacher":@data2,"admin":@data3}     
    end
end
