require './robotClass'
require './robotControls'
require './validationFunctions'
require './readInput'

#values assigned as directions eg. 0 => NULL, 1 => NORTH and likewise
DIRECTIONS = ['Null', 'NORTH', 'EAST', 'SOUTH', 'WEST']

#global flag check variable for checking validity of variables
$is_valid_valueset = false

#main function
def main
	continue = 'y'
	robot_on_table = false
	
	print("\nINSTRUCTIONS")
	print("\n============")
	print("\nThe first command should be a PLACE command. Any other command will be neglected.")
	print("\nFormat for PLACE command is PLACE x,y,face direction.")
	print("\nIt can be followed by any other command like MOVE, LEFT, RIGHT, PLACE or REPORT.")
	print("\nProgram ends after REPORT command.")
	
	print("\n\n=====================")
	print("\nSTARTING THE PROGRAM.")
	print("\n=====================")
	
	#Continue asking for the first command until a valid place command is entered.
	while(!robot_on_table)
		if(!$is_valid_valueset)
			first_valid_command = read_string("\nFIRST COMMAND :")
			details = place_robot_on_table(first_valid_command)
		else
			robot_on_table = true
			$is_valid_valueset = false
		end
	end
	
	#Continue with the robot commands until a report command is entered
	while(continue=='y' or continue=='Y')
		other_valid_commands = read_string("\nNEXT COMMAND  :")
		case other_valid_commands
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
			temp_details = place_robot_on_table(other_valid_commands)
			if($is_valid_valueset)
				details = temp_details
			end
		end
	end
end

#call for main function. Program starts from here.
main
