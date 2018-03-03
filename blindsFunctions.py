#!/usr/bin/python3
#import time, nanpy, nanpy.arduinotree, re, datetime, urllib.request
import time, datetime, re, urllib.request
from html.parser import HTMLParser

DEFAULT_LOG_PATH = '~/Desktop/git-megasaturnv/nanpy-blinds-control/log.csv'
MOTOR_CONTROLLER_POWER_PIN = 9 # Connects to a monostable 555 through a capacitor. When HIGH power will be given to the motor controller for 30 seconds via NPN transistor (consisting of an NPN transistor and a PNP power transistor), as a safety precaution incase the arduino crashes
MOTOR_CONTROLLER_POWER_RESET_PIN = 10 # When HIGH the 555 is not reset and the 555 output is allowed to go high if MOTOR_CONTROLLER_POWER_PIN is high
MOTOR_CURRENT_PIN = 15 #Input pin for current sensing the motor controller via a MAX471 ic. Note pin: 0, 8 and 14 are all A0 in nanpy. (0-7 = A0-A7, 8-13 = A0-A5, 14-22 = A0-A7)
BLINDS_UP_PIN = 14
BLINDS_DOWN_PIN = 13
LIGHT_SENSOR_PIN = 16

verbose = True
def print_v(text, newline=True):
    if verbose:
        print(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S ") + str(text), end='', flush=True)
    if newline:
        print()

#Class originally made by FileSottile at https://gist.github.com/FiloSottile/2352407
#Modified here for python3
class IDParser(HTMLParser):
	"""Modified HTMLParser that isolates a tag with the specified id"""
	def __init__(self, id):
		self.id = id
		self.result = None
		self.started = False
		self.depth = {}
		self.html = None
		self.watch_startpos = False
		HTMLParser.__init__(self)

	def loads(self, html):
		self.html = html
		self.feed(html)
		self.close()

	def handle_starttag(self, tag, attrs):
		attrs = dict(attrs)
		if self.started:
			self.find_startpos(None)
		if 'id' in attrs and attrs['id'] == self.id:
			self.result = [tag]
			self.started = True
			self.watch_startpos = True
		if self.started:
			if not tag in self.depth: self.depth[tag] = 0
			self.depth[tag] += 1

	def handle_endtag(self, tag):
		if self.started:
			if tag in self.depth: self.depth[tag] -= 1
			if self.depth[self.result[0]] == 0:
				self.started = False
				self.result.append(self.getpos())

	def find_startpos(self, x):
		# Needed to put the start position of the result (self.result[1]) after the opening tag with the requested id
		if self.watch_startpos:
			self.watch_startpos = False
			self.result.append(self.getpos())
	handle_entityref = handle_charref = handle_data = handle_comment = \
	handle_decl = handle_pi = unknown_decl = find_startpos

	def get_result(self):
		if self.result == None: return None
		if len(self.result) != 3: return None
		lines = self.html.split('\n')
		lines = lines[self.result[1][0]-1:self.result[2][0]]
		lines[0] = lines[0][self.result[1][1]:]
		if len(lines) == 1:
 			lines[-1] = lines[-1][:self.result[2][1]-self.result[1][1]]
		lines[-1] = lines[-1][:self.result[2][1]]
		return '\n'.join(lines).strip()

def get_element_by_id(id, html):
	"""Return the content of the tag with the specified id in the passed HTML document"""
	parser = IDParser(id)
	parser.loads(html)
	return parser.get_result()

def getSunPredictions(id, eventName):
	try:
		#Valid eventNames:
		#Astronomical twilight begins
		#Nautical twilight begins
		#Astronomical twilight begins
		#Nautical twilight begins
		#Dawn - civil twilight begins
		#Sunrise:
		#Sun at its highest (transit)
		#Sunset:
		#Dusk - civil twilight ends
		#Nautical twilight ends
		#Astronomical twilight ends
		with urllib.request.urlopen('http://www.ukweathercams.co.uk/sunrise_sunset_times.php?id=' + str(id)) as response:
			html = response.read().decode('utf-8')

		#Very bad parsing of website for sun information...
		sunPredictionsTable = get_element_by_id('sun_predictions', html) #Return all content within <div id="sun_predictions">
		sunPredictionsTable = re.sub(r'<.*?>', ' ', sunPredictionsTable) #Remove all html tags
		sunPredictionsTable = re.sub(r'^\s*$\n', '', sunPredictionsTable, flags=re.MULTILINE) #Remove blank lines
		sunPredictionsTable = re.sub(r'\n^\s*$', '', sunPredictionsTable, flags=re.MULTILINE) #Remove blank lines
		sunPredictionsTable = re.sub(r'[^\S\r\n]{2,}', ' ', sunPredictionsTable) #Converts multiple spaces into one space (check: is \S correct?)
		sunPredictionsTable = re.sub(r'^ ', '', sunPredictionsTable, flags=re.MULTILINE) #Removes lines that begin with ' '
		sunPredictionsTable = re.sub(r'\n(?=\d)', '', sunPredictionsTable) #delete newline character before time if time on a line without a title

		searchResultLine = re.search(eventName + r'.*$', sunPredictionsTable, flags=re.MULTILINE).group() #Search for correct line
		searchResultTime = re.search(r'\d\d:\d\d:\d\d',searchResultLine).group() #Search for time of event
		searchResultDatetime = datetime.datetime.combine(datetime.datetime.now().date(), datetime.datetime.strptime(searchResultTime, '%H:%M:%S').time()) #Convert searchResultTime string into datetime.time, and add the current date wth datetime.combine to produce a datetime$
		print_v('Info: eventName = ' + eventName + '    searchResultDatetime = ' + str(searchResultDatetime))
		return searchResultDatetime
	except Exception as f:
		print('Error: The following exception occured  in getSunPredictions:')
		print(f)
		writeToLogFile(f)
		#return datetime.datetime(1, 1, 1, 1, 1)
	except:
		print('Error: Unknown exception in getSunPredictions!')

def writeToLogFile(text, LOG_NAME='log', LOG_PATH=DEFAULT_LOG_PATH):
	try:
		print_v('Info: Wrote to ' + LOG_NAME + ' file: ' + str(text))
		logFile = open(LOG_PATH, 'a')
		logFile.write(datetime.datetime.now().strftime('%Y-%m-%dT%H:%M:%S')+', ' + str(text) + '\n')
		logFile.close()
	except Exception as e:
		print('Error: Failed to write to ' + LOG_NAME + ' file. Text: [' + str(text) + ']')
		print('Writing to ' + LOG_NAME + ' log file failed because: ' + str(e))

def setupPins(aa):
	global MOTOR_CONTROLLER_POWER_PIN, MOTOR_CONTROLLER_POWER_RESET_PIN, BLINDS_UP_PIN, BLINDS_DOWN_PIN, MOTOR_CURRENT_PIN
	print_v('Info: Setting up pins')
	aa.pinMode(MOTOR_CONTROLLER_POWER_PIN, aa.OUTPUT)
	aa.pinMode(MOTOR_CONTROLLER_POWER_RESET_PIN, aa.OUTPUT)
	aa.pinMode(BLINDS_UP_PIN, aa.OUTPUT)
	aa.pinMode(BLINDS_DOWN_PIN, aa.OUTPUT)
	aa.pinMode(MOTOR_CURRENT_PIN, aa.INPUT)

def unsetPins(aa):
	print_v("Info: Setting all pins to input, low")
	for i in range(1,20):
		aa.digitalWrite(i, aa.LOW)
		aa.pinMode(i, aa.INPUT)
		time.sleep(0.05)

def motorControllerState(aa, state):
	if state:
		print_v('Info: Motor controller online')
		aa.digitalWrite(MOTOR_CONTROLLER_POWER_RESET_PIN, aa.HIGH)
		time.sleep(0.2)
		aa.digitalWrite(MOTOR_CONTROLLER_POWER_PIN, aa.HIGH)
		time.sleep(0.4)
		aa.digitalWrite(MOTOR_CONTROLLER_POWER_PIN, aa.LOW)
		time.sleep(0.4)
	else:
		print_v('Info: Motor controller offline')
		aa.digitalWrite(MOTOR_CONTROLLER_POWER_RESET_PIN, aa.LOW)
		aa.digitalWrite(MOTOR_CONTROLLER_POWER_PIN, aa.LOW)

def getMotorCurrent(aa, pin=MOTOR_CURRENT_PIN):
	global MOTOR_CURRENT_PIN
	current = aa.analogRead(pin)*(5/1023)
	print_v('Info: Motor current for pin ' + str(pin) + '    ' + str(current))
	return current

def getBrightness(aa, pin=LIGHT_SENSOR_PIN):
	global LIGHT_SENSOR_PIN
	brightness = 1023 - aa.analogRead(pin)
	print_v('Info: Brightness for light sensor on pin ' + str(pin) + '    ' + str(brightness))
	return brightness

def blindsUp(aa):
	print_v('Info: Blinds up')
	aa.digitalWrite(BLINDS_UP_PIN, aa.HIGH)
	aa.digitalWrite(BLINDS_DOWN_PIN, aa.LOW)

def blindsDown(aa):
	print_v('Info: Blinds down')
	aa.digitalWrite(BLINDS_UP_PIN, aa.LOW)
	aa.digitalWrite(BLINDS_DOWN_PIN, aa.HIGH)

def blindsStop(aa):
	print_v('Info: Blinds stop')
	aa.digitalWrite(BLINDS_UP_PIN, aa.LOW)
	aa.digitalWrite(BLINDS_DOWN_PIN, aa.LOW)
	motorControllerState(aa, False) # Cut power to motor controller and send 555 into reset mode, both of which will cut power to the motor controller

def blinds(aa, dir, runningTime, maxCurrent):
	motorControllerState(aa, True)
	if dir == 'u':
		blindsUp(aa)
	elif dir == 'd':
		blindsDown(aa)
	else:
		print('Error: Direction not recognised. Stopping motor...')
		blindsStop(aa)

	stopTime = datetime.datetime.now() + datetime.timedelta(seconds=runningTime)
	for i in range (0,int((runningTime + 2) * 5)):
		time.sleep(0.2)
		if getMotorCurrent(aa) > maxCurrent:
			print('Error: MAX_MOTOR_CURRENT exceeded. Stopping motor...')
			break
		if datetime.datetime.now() >= stopTime:
			print_v('Info: Blind movement stopped')
			break

	if dir == 'u':
		print_v('Info: Releasing tension in blinds')
		blindsDown(aa) #Release tension on blinds
		time.sleep(0.25)

	blindsStop(aa)
	motorControllerState(aa, False) # Just to be sure, make sure 555 is reset

#Note: how to calculate seconds until a time is reached: (datetime.timedelta(hours=24) - (datetime.datetime.now() - datetime.datetime.now().replace(hour=17, minute=30, second=0, microsecond=0))).total_seconds() % (24 * 3600)
