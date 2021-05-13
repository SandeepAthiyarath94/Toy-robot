#function to check validity of coordinates.
def check_for_valid_coordinates x,y
	if(x>5 or x<0)
		print("\nThe value of X should fall between 0 and 5\n")
		return false
	elsif(y>5 or y<0)
		print("\nThe value of Y should fall between 0 and 5\n")
		return false
	else
		return true
	end
end

#function to check validity of direction
def check_for_valid_direction f
	case f
	when "NORTH"
		movement_direction_indicator = 1
	when "SOUTH"
		movement_direction_indicator = 3
	when "EAST"
		movement_direction_indicator = 2
	when "WEST"
		movement_direction_indicator = 4
	else
		movement_direction_indicator = 0
		print("\nNot a valid direction.\n")
	end
	return movement_direction_indicator
end