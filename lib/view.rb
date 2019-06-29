require 'json'

class View

  def create_teacher
    puts "To sign up, please complete this question."
    puts "What is your firstname ?"
    print ">"
    firstname = gets.chomp
    puts "What is your lastname ?"
    print ">"
    lastname = gets.chomp
    puts "What is your field ?(please enter the number of the lines)"
    json = File.read("./data.json")
    hash = JSON.parse(json)
    hash["fields"].each do |key|
      puts "#{key["id"]}. #{key["name"]} "
    end
    print ">"
    field_id = gets.chomp.to_i
    puts "What is your level ?(please enter the number of the lines)"
    hash["levels"].each do |key|
      puts "#{key["id"]}. #{key["grade"]} in the #{key["cycle"]}"
    end
    print ">"
    level_id = gets.chomp.to_i
    return params = {firstname: firstname, lastname: lastname, field: field_id, level: level_id}
  end

end