require 'controller'

class Router

  def perform
    @controller =  Controller.new
    while true 

      puts "What do you want?(please enter number of the lines)"
      puts "1. Create a new teacher"
      puts "2. Do a request"
      puts "3. Close the application"
      
      print "> "
      params = gets.chomp.to_i

      case params
      when 1
        @controller.create_teacher
      when 3
        puts "Ok, bye"
        break
      when 2
        @controller.create_request
      end
    
    end
  end

end

