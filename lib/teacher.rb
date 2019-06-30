require 'json'

class Teacher

  attr_accessor :teacher


  def initialize(firstname, lastname, field_id, level_id)
    json = File.read("./data.json")
    hash = JSON.parse(json)
    @id = hash["teachers"].length + 1
    @firstname = firstname
    @lastname = lastname
    @field_id = field_id
    @level_id = level_id

    @teacher = {id: @id, firstname: @firstname, lastname: @lastname, field_id: @field_id, level_id: @level_id}
  end

  def save
    json = File.read("./data.json")
    hash = JSON.parse(json)
    hash["teachers"] << @teacher
    File.open("./data.json","w") do |f|
      f.write(JSON.pretty_generate(hash))
    end
  end

end