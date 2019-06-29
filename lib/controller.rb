require 'view'
require 'teacher'

class Controller

  def create_teacher
    params = View.new.create_teacher
    firstname = params[:firstname]
    lastname = params[:lastname]
    field_id = params[:field]
    level_id = params[:level]
    teacher = Teacher.new(firstname, lastname, field_id, level_id)
    teacher.save
  end

end