class Api::V1::StudentsController < ApplicationController
  def index
    students = Student.all
    render json: StudentSerializer.new(students)
  end
end