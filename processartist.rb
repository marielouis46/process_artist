require 'ruby-processing'
class ProcessArtist < Processing::App

	def setup
		background(0, 0, 0)
		@size = 150
		@queue = ""
	end

	def draw
		#do stuff
	end

	def key_pressed
		warn "A key was pressed! #{key.inspect}"
	  if @queue.nil?
	  	@queue = ""
	  end
	  if key == "+"
		warn "You pressed plus"
		@size += 20
	elsif key == "-"
		warn "You pressed minus"
		@size -= 20
	elsif key != "\n"
	  	@queue = @queue + key
	else
	  	warn "Time to run the command: #{@q1ueue}"
	  	run_command(@queue)
	  	@shape = @queue.chomp
	  	@queue = ""
	  
	  end
	end
	def run_command(command)
		if command.start_with?("b")
			color = command[1..-1]
			colors = color.split(',')
		   background(colors[0].to_i,colors[1].to_i,colors[2].to_i)
		elsif command.start_with?("f")
			change = command[1...-1]
			changes = change.split(',')
		 fill(changes[0].to_i,changes[1].to_i,changes[2].to_i)
     		puts "The color is changing!!!"
		elsif 
			changing_shape
		#elsif 
		#	erase
		end
    end
		
	def mouse_pressed
		warn "The mouse is pressed"
	end

	def mouse_dragged
		warn "The mouse is being dragged"
		mouse_x
		warn "Mouse is X: #{mouse_x}"
		mouse_y
		warn "Mouse is Y: #{mouse_y}"
		changing_shape
	end
	
	def mouse_released
		warn "The mouse has been released"
	end

	def changing_shape
		case @shape
		when "s1" then rect(mouse_x,mouse_y,@size,@size)
		when "s2" then rect(mouse_x,mouse_y,@size * 2,@size * 2)
		when "s3" then oval(mouse_x,mouse_y,@size * 2,@size)
		when "s4" then oval(mouse_x, mouse_y,@size,@size * 2) 
		when "s5" then rect(mouse_x,mouse_y, @size,@size)
		when "s6" then oval(mouse_x,mouse_y,@size,@size)
		else 
			warn "I dont know that command"
		end
	end

	def erase
		#if the users presses "c"
		if command.start_with?("c")
		#clear the sreen

		#elsif the user presses "e"
	elsif command.start_with?("e")
		#rect(100,100,50,50)
		rect(100,100,50,50)
		#draw background
		background = fill
		#elsif the user presse "a"
	elsif command.start_with?("a")
		mouse_released
		background
	end
end

ProcessArtist.new(:width =>700, :height => 700,
	:title => "ProcessArtist", :full_screen => false)