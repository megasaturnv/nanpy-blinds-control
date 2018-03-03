#!/usr/bin/python3
import time, nanpy, nanpy.arduinotree, re, datetime, urllib.request
import blindsFunctions

UKWEATHERCAMS_LOCATION = 23219 #Location id number in http://www.ukweathercams.co.uk/sunrise_sunset_times.php?id=xxxxx
SUNRISE_EVENT_NAME = 'Sunrise:'
SUNRISE_OFFSET_MINUTES = 0
SUNSET_EVENT_NAME = 'Sunset:'
SUNSET_OFFSET_MINUTES = 40
EARLIEST_BLINDS_DOWN_TIME = datetime.time(12)

MINIMUM_SUNLIGHT = 400 #The minimum amount of sunlight before the blinds close (because it is too dark). 0 = Darkness, 1023 = full Daylight
BLINDS_UP_RUNNING_TIME = 18.7 # The amount of time it takes to raise the blinds in seconds
BLINDS_DOWN_RUNNING_TIME = 17.2 # The amount of time it takes to lower the blinds in seconds
MAX_MOTOR_CURRENT = 0.4 # Maximum current the motor can draw in Amps before it is cut out for safety. Uses MAX471 ic for current sensing

#Note: how to calculate seconds until a time is reached: (datetime.timedelta(hours=24) - (datetime.datetime.now() - datetime.datetime.now().replace(hour=17, minute=30, second=0, microsecond=0))).total_seconds() % (24 * 3600)

if (datetime.datetime.now().weekday() in [0,1,2,3,4]):
	blindsUpTime = datetime.datetime.combine(datetime.datetime.now().date(), datetime.time(7,40,0)) #If weekday, open at 7:40
	blindsFunctions.print_v('Info: Weekday! blindsUpTime set to ' + str(blindsUpTime))
elif (datetime.datetime.now().weekday() in [5,6]):
	blindsUpTime = datetime.datetime.combine(datetime.datetime.now().date(), datetime.time(9,0,0)) #If weekend, open at 9:00
	blindsFunctions.print_v('Info: Weekend! blindsUpTime set to ' + str(blindsUpTime))
else:
	print('Error: Unknown day of the week')
	blindsUpTime = datetime.datetime.combine(datetime.datetime.now().date(), datetime.time(9,0,0)) #If unknown weekday, open at 9:00

blindsDownTime = datetime.datetime.combine(datetime.datetime.now().date(), datetime.time(16,30,0)) #Set blindsDownTime to 4:30pm, for manual control

##Uncomment for up and down time to depend on sunrise and sunset, instead of fixed manual times
#blindsUpTime = None
blindsDownTime = None

connection = nanpy.SerialManager(device='/dev/ttyUSB0')
aa = nanpy.ArduinoApi(connection=connection)
at = nanpy.arduinotree.ArduinoTree(connection=connection)

try:
	if blindsUpTime == None:
		blindsUpTime = blindsFunctions.getSunPredictions(UKWEATHERCAMS_LOCATION, SUNRISE_EVENT_NAME) + datetime.timedelta(minutes=SUNRISE_OFFSET_MINUTES)
	if blindsDownTime == None:
		blindsDownTime = blindsFunctions.getSunPredictions(UKWEATHERCAMS_LOCATION, SUNSET_EVENT_NAME) + datetime.timedelta(minutes=SUNSET_OFFSET_MINUTES)

	blindsFunctions.print_v('Blinds will open at:  ' + str(blindsUpTime))
	blindsFunctions.print_v('Blinds will close at: ' + str(blindsDownTime))

	blindsFunctions.setupPins(aa)
	blindsFunctions.motorControllerState(aa, False)

	#Is the blind up or down? If it is daytime, assume the blind is up. Else, assume the blind is down
	if (datetime.datetime.now() < blindsUpTime): #It is before sunrise, assume blind is down
		blindsFunctions.writeToLogFile('Early!')
		time.sleep((blindsUpTime - datetime.datetime.now()).seconds) #Wait until blindsUpTime
		blindsFunctions.writeToLogFile('Raising blinds')

		blindsFunctions.blinds(aa, 'u', BLINDS_UP_RUNNING_TIME, MAX_MOTOR_CURRENT) #Raise blinds

	if datetime.datetime.now().time() < EARLIEST_BLINDS_DOWN_TIME:
		blindsFunctions.writeToLogFile('Daytime, Before EARLIEST_BLINDS_DOWN_TIME!')
		time.sleep((datetime.datetime.combine(datetime.datetime.now(), EARLIEST_BLINDS_DOWN_TIME) - datetime.datetime.now()).total_seconds() + 10) #Wait until EARLIEST_BLINDS_DOWN_TIME (+ten seconds)
		#time.sleep((EARLIEST_BLINDS_DOWN_TIME - datetime.datetime.now()).seconds) #Wait until EARLIEST_BLINDS_DOWN_TIME

	if (datetime.datetime.now() > blindsUpTime and datetime.datetime.now().time() > EARLIEST_BLINDS_DOWN_TIME and datetime.datetime.now() < blindsDownTime): #It is daytime, assume blind is up. It is after EARLIEST_BLINDS_DOWN_TIME
		blindsFunctions.writeToLogFile('Daytime, After EARLIEST_BLINDS_DOWN_TIME!')

		running = True
		while running:
			if blindsFunctions.getBrightness(aa) < MINIMUM_SUNLIGHT or datetime.datetime.now() > blindsDownTime: #If brightness is too low or it is after blindsDownTime
				running = False
			else:
				if datetime.datetime.now() > blindsDownTime - datetime.timedelta(minutes=5): #If blindsDownTime is less than 5 minutes away
					time.sleep((blindsDownTime - datetime.datetime.now()).seconds) #Wait until blinds down time
					running = False
				else:
					time.sleep(5*60) #Wait 5 minutes

		blindsFunctions.writeToLogFile('Lowering blinds')
		blindsFunctions.blinds(aa, 'd', BLINDS_DOWN_RUNNING_TIME, MAX_MOTOR_CURRENT) #Lower blinds

	#Else, It is after sunset, assume blind is down. Therefore no action required between now and midnight, exit program
	blindsFunctions.writeToLogFile('Nighttime!')

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
