EXECUTION OF PROGRAM
====================
1. To maually run the commands
Open cmd.
Navigate to the location of the file.
Run command - ruby ToyRobot.rb

2. Automatically run commands from the file
Open cmd.
Navigate to the location of the file.
Run command - ruby RobotTest.rb
Enter the name of the file to be executed

FILE FORMAT FOR RUNNING AUTOMATED TEST
======================================
First line of the file contains the number of commands that follow in the file.
Each line contains one command

Eg, a file which contains 7 commands is as follows,
7
place 2,3,north
move
move
left
left
right
report

LIST OF FILES
=============
Readme.txt
ToyRobot.rb
robotClass.rb
readinput.rb
robotControls.rb
validationFunctions.rb
RobotTest.rb

VALID COMMANDS FOR MANUAL PROGRAM
==========================
commands can be entered in lower or uppercase.
1. PLACE x,y,f where x and y are integers and f is face direction of robot.
valid values for f are north, south, east and west.
commands can be entered in lower or uppercase.

2.MOVE
moves the robot 1 unit in the direction it is facing.
If the robot is on the edge of the table before executing the move command, the move command is ignored.

3.LEFT
Rotates the robot 90 degrees to left from the current face direction.
ie,     NORTH changes to WEST
	WEST changes to SOUTH
	SOUTH changes to EAST
	EAST changes to NORTH

4.RIGHT
Rotates the robot 90 degrees to right from the current face direction.
ie,     WEST changes to NORTH	
	SOUTH changes to WEST 
	EAST changes to SOUTH 
	NORTH changes to EAST 

5.REPORT
Prints out the current coordinates of the robot and the face directions.
The program ends after the report command is executed. 

PROGRAM FEATURES
================
1. Place a robot in a valid coordinate on successful execution
If the coordinates lie outside the table, the command is ignored.
If the number of arguments are not matching, the command is ignored.
If no valid direction is given, command is ignored.
Program should start with a place command. All other commands are ignored until a valid place command is used.

2. Move command moves the robot 1 unit forward in the direction faced by the robot.
If the robot is on the edge of the table and further movement results the robot to fall, the move command is ignored.

3.Left and right commands rotate the robot 90 degrees to left and right respectively.

4.It is assumed that the program ends after the report statement is executed.

5.Place statement can be executed at any time to move the robot to a new location on the table. Valid new place command moves the robot to the new specified location. Invalid command is ignored and the previous position is retained.

TEST DATASETS
=============
SET 1
-----
MOVE (ignored)
REPORT (ignored)
PLACE 2,3,NORTH (first valid command)
MOVE
RIGHT
MOVE
REPORT (End of program)

Expected output ---> 3,4,EAST

SET 2
-----
PLACE 2,1,SOUTH(first valid command)
MOVE
MOVE (ignored)
LEFT
MOVE
REPORT(End of program)

Expected output ---> 3,0,EAST

SET 3
-----
PLACE 2,3,NORTH (first valid command)
MOVE
LEFT
PLACE 0,0,EAST
MOVE
REPORT(End of program)

Expected output ---> 1,0,EAST

SET 4
-----
PLACE 2,3,NORTH (first valid command)
MOVE
LEFT
PLACE 6,0,EAST(ignored)
MOVE
REPORT(End of program)

Expected output ---> 1,4,WEST


SET 5
-----
place 2,3,north
move
move
left
left
right
report

Expected Output ---> 2,5,WEST
