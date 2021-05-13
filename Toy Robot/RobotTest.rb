require './robotClass'
require './robotControls'
require './validationFunctions'

#values assigned as directions eg. 0 => NULL, 1 => NORTH and likewise
DIRECTIONS = ['Null', 'NORTH', 'EAST', 'SOUTH', 'WEST']
#global flag check variable for checking validity of variables

#Read the commands from file line by line and execute each command
def read_commands_from_file commands_from_file
	#number of commands present in the file
	count = commands_from_file.gets.chomp.to_i
	i=0
	robot_on_table = false
	
	#check for the first valid place command
	while(!robot_on_table and i<count)
		command = commands_from_file.gets.chomp.upcase
		if ($is_valid_valueset)
			robot_on_table = true
			$is_valid_valueset = false
		else
			details = place_robot_on_table(command)
			i+=1
		end
	end
	
	#execute rest of the commands till a report command is encountered or end of file is reached.
	#Note that the robot details are displayed only if a report command is encountered.
	while (i<count)
		i+=1
		case command
		when "MOVE"
			move_robot_forward(details)
		when "RIGHT"
			turn_robot_right(details)
		when "LEFT"
			turn_robot_left(details)
		when "REPORT"
			report_robot_details(details)
			print("\nEND OF PROGRAM")
			continue = 'n'			
		else
			#move the robot to a new place if and only if a valid place command is entered. Else, the previous values are retained.
			temp_details = place_robot_on_table(command)
			if($is_valid_valueset)
				details = temp_details
			end
		end
		if(continue!='n')
			command = commands_from_file.gets.chomp.upcase
		end
	end
end

def main
	print("\nEnter the test file name (without extension eg, for a file named test.txt, type in test) : ")
	file_name = gets.chomp
	file_name+='.txt'
	print(file_name)

	#on successful opening of the file, read the contents else display error message
	if(File.exist?(file_name))
		commands_from_file = File.new(file_name, "r")
		read_commands_from_file(commands_from_file)
		commands_from_file.close()
	else
		puts ' File does not exist'
	end

end

main