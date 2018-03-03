#!/usr/bin/python3
import time, nanpy, nanpy.arduinotree, re, datetime, urllib.request
import blindsFunctions

BLINDS_UP_TIME = 18.7   # The amount of time it takes to raise the blinds in seconds
BLINDS_DOWN_TIME = 17.2 # The amount of time it takes to lower the blinds in seconds
MAX_MOTOR_CURRENT = 0.4 # Maximum current the motor can draw in Amps before it is cut out for safety. Uses MAX471 ic for current sensing

connection = nanpy.SerialManager(device='/dev/ttyUSB0')
aa = nanpy.ArduinoApi(connection=connection)
at = nanpy.arduinotree.ArduinoTree(connection=connection)

try:
	blindsFunctions.setupPins(aa)
	blindsFunctions.motorControllerState(aa,False)

	blindsFunctions.writeToLogFile('Raising blinds manually')
	blindsFunctions.blinds(aa, 'u', BLINDS_UP_TIME, MAX_MOTOR_CURRENT) #Lower blinds
except Exception as e:
	print('Error: The following exception occured:')
	print(e)
	blindsFunctions.writeToLogFile(e)
except:
	print('Error: An exception occured')
finally:
	blindsFunctions.motorControllerState(aa, False) # Just to be sure, make sure 555 is reset
	blindsFunctions.unsetPins(aa)

blindsFunctions.motorControllerState(aa, False) # Just to be sure, make sure 555 is reset
blindsFunctions.unsetPins(aa)
