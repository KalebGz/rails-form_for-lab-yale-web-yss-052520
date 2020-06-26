class StudentsController < ApplicationController

    def new
        @student = Student.new
    end

    def create
        student = Student.new(student_params)

        if(student.valid?)
            student.save
            redirect_to student
        else
            flash[:errors] = student.errors.full_messages
            redirect_to new_student_path
        end
    end

    def show
        @student = Student.find(params[:id])
    end

    def edit
        @student = Student.find(params[:id])
    end

    def update
        student = Student.find(params[:id])
        student.update(student_params)

        redirect_to student_path(student)
    end

    private

   def student_params
    params.require(:student).permit(:first_name, :last_name)
    end
end

