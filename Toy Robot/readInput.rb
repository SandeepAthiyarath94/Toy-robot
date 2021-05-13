#function to print a prompt and return the uppercase string value of the user input.
def read_string prompt
	puts prompt
	value = gets.chomp
	value = value.upcase
end