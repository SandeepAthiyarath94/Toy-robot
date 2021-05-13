#class declaration for the robot details
class RobotLocationDetails
	attr_accessor :x, :y, :f
	def initialize (x, y, f)
		@x = x
		@y = y
		@f = f
	end
end