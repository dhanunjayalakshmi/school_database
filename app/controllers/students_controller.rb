class StudentsController < ApplicationController
  def index
    if params[:section_id]
      @section = Section.find(params[:section_id])
      @students = @section.students.all
    elsif params[:house_id]
      @house = House.find(params[:house_id])
      @students = @house.students.all
    else
      @students = Student.all
    end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Successfully added a student."
      redirect_to students_path
    else
      flash[:error] = "Oops! Looks like you forgot to fill in a few fields."
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update_attributes(student_params)
    #debugger
    redirect_to students_path
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy!
    redirect_to students_path
  end

private
def student_params
  params.require(:student).permit(:roll_no, :name, :address, :fathers_name, :emergency_contact, :blood_type, :gender, :dob, :section_id, :house_id)
end
end
