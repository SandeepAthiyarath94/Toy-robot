#function for placing the robot on the table
def place_robot_on_table command
	
	#Splitting the PLACE command to extract details
	split_command = command.split(' ', 2)
	is_valid_coordinates = false
	movement_direction_indicator = 0
	
	#Perform check only if the command begins with PLACE and the provided details contain all 3 arguments
	if(split_command[0]=="PLACE" and split_command[1]!=nil)
		input_arguments_list = split_command[1].split(',',-1)
		
		#if the number of input arguments is 3, assign coordinate values and face direction to variables
		if(input_arguments_list.length == 3)
			x = input_arguments_list[0].to_i
			y = input_arguments_list[1].to_i
			f = input_arguments_list[2]
			
			#Perform valid coordinate check
			is_valid_coordinates = check_for_valid_coordinates(x,y)
			
			#Perform valid direction and return a differnt numerical equivalent for each direction 
			movement_direction_indicator = check_for_valid_direction(f).to_i
		else
			print("\nWrong number of arguments.")
		end
	else
		print("\nWrong command\n")
	end
	
	#Write values to a class variable if all checks are passed else write default invalid values
	if(is_valid_coordinates and movement_direction_indicator!=0)
		
		$is_valid_valueset = true
		details = RobotLocationDetails.new(input_arguments_list[0].to_i,input_arguments_list[1].to_i,movement_direction_indicator)
	else
		$is_valid_valueset = false
		details = RobotLocationDetails.new(-1,-1,0)
	end
end

#function to move the robot based on the face direction
def move_robot_forward details
	if(details.f == 1 and details.y<5)
		details.y += 1
	elsif(details.f == 2 and details.x<5)
		details.x += 1
	elsif(details.f == 3 and details.y>0)
		details.y -= 1
	elsif(details.f == 4 and details.x>0)
		details.x -= 1
	else
		print("\nRobot will fall off the table. Aborting movement.")
	end
	details
end

#function to turn the robot right by 90 degree
def turn_robot_right details
	if(details.f == 4)
		details.f = 1
	else
		details.f += 1
	end
	details
end

#function to turn the robot left by 90 degree
def turn_robot_left details
	if(details.f == 1)
		details.f = 4
	else
		details.f -= 1
	end
	details
end

#function to print the final coordinate details and face direction of the robot
def report_robot_details details
	print("\nCurrent position details")
	printf("\nFORMAT : (X,Y) - Face Direction => (%d,%d) - %s", details.x, details.y, DIRECTIONS[details.f])
end