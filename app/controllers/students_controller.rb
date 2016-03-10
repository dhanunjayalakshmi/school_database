class StudentsController < ApplicationController
  def index
    if params[:section_id]
      @section = Section.find(params[:section_id])
      @students = @section.students
    elsif params[:house_id]
      @house = House.find(params[:house_id])
      @students = @house.students
    else
      @students = Student.all
    end
  end

  def new
    if params[:section_id]
      @section = Section.find(params[:section_id])
      @student = @section.students.new
    else
      @student = Student.new
    end
  end

  def create
    @student = Student.new(student_params)
    @section_id = @student.section_id
    if @student.save
      flash[:success] = "Successfully added a student."
      redirect_to students_path(section_id: @section_id)
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
    @section_id = @student.section_id
    @student.update_attributes(student_params)
    redirect_to students_path(section_id: @section_id)
  end

  def destroy
    @student = Student.find(params[:id])
    @section_id = @student.section_id
    @student.destroy!
    redirect_to students_path(section_id: @section_id)
  end

private
def student_params
  params.require(:student).permit(:roll_no, :name, :address, :fathers_name, :emergency_contact, :blood_type, :gender, :dob, :section_id, :house_id)
end
end
