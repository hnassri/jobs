require 'view'
require 'teacher'
require 'json'
require 'client'

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

  def create_request
    params = View.new.create_request
    firstname = params[:firstname]
    lastname = params[:lastname]
    field_id = params[:field]
    level_id = params[:level]
    client = Client.new(firstname, lastname, field_id, level_id)
    client.save
    Controller.new.search(client)
  end

  def search(client)
    json = File.read("./data.json")
    hash = JSON.parse(json)
    match = Array.new
    hash["teachers"].each do |teacher|
      if teacher["field_id"] == client.field_id && teacher["level_id"] == client.level_id
        match << teacher
      end
    end
    teacher_id = View.new.matching(match)
    client_id = client.id   
    client.update_teacher_id(teacher_id, client_id)
  end


end