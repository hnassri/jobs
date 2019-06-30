class Client

  attr_accessor :client, :level_id, :field_id, :id

  def initialize(firstname, lastname, field_id, level_id)
    json = File.read("./data.json")
    hash = JSON.parse(json)
    @id = hash["requests"].length + 1
    @firstname = firstname
    @lastname = lastname
    @field_id = field_id
    @level_id = level_id
    @client = {id: @id, firstname: @firstname, lastname: @lastname, field_id: @field_id, level_id: @level_id, teacher_id: nil}
  end

  def save
    json = File.read("./data.json")
    hash = JSON.parse(json)
    hash["requests"] << @client
    File.open("./data.json","w") do |f|
      f.write(JSON.pretty_generate(hash))
    end
  end

  def update_teacher_id(teacher_id, client_id)
    json = File.read("./data.json")
    hash = JSON.parse(json)
    hash["requests"][client_id - 1]["teacher_id"] = teacher_id
    File.open("./data.json","w") do |f|
      f.write(JSON.pretty_generate(hash))
      puts "Thank you. Your request has been taken into account"
    end
  end

end