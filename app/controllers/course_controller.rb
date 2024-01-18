class CourseController < ApplicationController

    #before_action :authorize_request,:authorize_teacher

    def viewcourses
        @mycourse = Course.all
            render json: @mycourse
    end
    
    def createcourse 
        puts "hi"
        course = Course.create!(course_name:params["cname"],duration:params["duration"],ongoing:1);
    
        if course
            render json: course,status: :created
        else
            render json: {error:"failed to create entity"},status: :unprocessable_entity
        end
    end
    
end
