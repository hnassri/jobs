require 'json'

class View

  def create_teacher
    puts "To sign up, please complete this questions."
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

  def create_request
    puts "To do a request, please answer this questions"
    puts "What is your firstname ?"
    print ">"
    firstname = gets.chomp
    puts "What is your lastname ?"
    print ">"
    lastname = gets.chomp
    puts "What field searched you ?(please enter the number of the lines)"
    json = File.read("./data.json")
    hash = JSON.parse(json)
    hash["fields"].each do |key|
      puts "#{key["id"]}. #{key["name"]} "
    end
    print ">"
    field_id = gets.chomp.to_i
    puts "What level searched you ?(please enter the number of the lines)"
    hash["levels"].each do |key|
      puts "#{key["id"]}. #{key["grade"]} in the #{key["cycle"]}"
    end
    print ">"
    level_id = gets.chomp.to_i
    return params = {firstname: firstname, lastname: lastname, field: field_id, level: level_id}
  end

  def matching(match)
    teacher_id = 0
    if match.empty? == false
      puts "Select the teacher what you want(please enter the number of the lines)"
      match.each do |teacher|
        puts "#{teacher["id"]}. #{teacher["lastname"] + " " + teacher["firstname"]}"
      end
      print ">"
      teacher_id = gets.chomp.to_i
    else
      puts "Sorry but any teacher matches with your request"
    end
    return teacher_id
  end

end