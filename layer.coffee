# ---------------- TO DO'S ---------------- #
# - Simplify javascript or jQuery Events 
# ✓ Don't create a layer with the same id
# - Edit layer's properties inside functions
# - Automatically set the var name as the id
# - Recognize Chrome from Safari
# ----------------------------------------- #

# ------- A U T H O R -------
# ---------------------------
# - Lorenzo Ferrante © 2015 -
# --------- Proto.js --------
# --------- v. 1.5.0 --------
# ---------------------------
# ------- A U T H O R -------

# --------------------------------------------
# Some code has been taken from Framer Source
# https://github.com/koenbok/Framer
# --------------------------------------------

# Require jQuery file
require ['./js/jquery.min'], (dependency) ->
# Reload window on resize
dimensions = () ->
	screenWidth = $(window).width()
	screenHeight = $(window).height()

$(window).resize ->
	dimensions()
	location.reload()

# -------------- #
# --- Errors --- #
# -------------- #
Errors = {
	sameID: 'Two div have the same id!
			Change the name in the layer declaration.'
	wrongCenterValue : 'You inserted a wrong value for the center
			properties. Please check it. The only possibilities
			are: x, y, both.'
}

# -------------- #
# --- Detect --- #
# -------------- #
Detect = {}
Utils = {}

Utils.deviceType = ->
	# Taken from
	# https://github.com/jeffmcmahan/device-detective/blob/master/bin/device-detect.js
	if /(mobi)/i.test(navigator.userAgent)
		return "phone"
	if /(tablet)|(iPad)/i.test(navigator.userAgent)
		return "tablet"
	return "desktop"

Detect.isChrome = ->
	(/chrome/).test(navigator.userAgent.toLowerCase())

Detect.isSafari = ->
	(/safari/).test(navigator.userAgent.toLowerCase())

Detect.isTouch = ->
	window.ontouchstart is null

Detect.isDesktop = ->
	Utils.deviceType() is "desktop"

Detect.isPhone = ->
	Utils.deviceType() is "phone"

Detect.isTablet = ->
	Utils.deviceType() is "tablet"

if Detect.isChrome()
	console.log 'Using Chorme'
if Detect.isSafari()
	console.log 'Using Safari'
if Detect.isTouch()
	console.log 'Using Touch device'
if Detect.isDesktop()
	console.log 'Using Desktop browser'
if Detect.isPhone()
	console.log 'Using Phone'
if Detect.isTablet()
	console.log 'Using Tablet'

# -------------- #
# --- Events --- #
# -------------- #
if Detect.isTouch()
	onTouchStart = "touchstart"
	onTouchEnd = "touchend"
	onTouchMove = "touchmove"
else
	onTouchStart = "mousedown"
	onTouchEnd = "mouseup"
	onTouchMove = "mousemove"

onClick = onTouchEnd

onMouseOver = "mouseover"
onMouseOut = "mouseout"
onMouseMove = "mousemove"

onAnimationStart = "start"
onAnimationStop = "stop"
onAnimationEnd = "end"

onScroll = "scroll"

# ------------- #
# --- Layer --- #
# ------------- #
idArray = []

class Layer
	# Define layer's properties
	@properties = {
		width: @width,
		height: @height,
		backgroundColor: @backgroundColor,
		position: @position,
		x: @x,
		y: @y,
		z: @z,
		borderRadius: @borderRadius,
		boxShadow: @boxShadow,
		center: @center
	}

	constructor: (@name, @properties) ->
		# Create new <div> element
		newDiv = document.createElement 'div' 
		document.body.appendChild newDiv
		newDiv.id = name
		# Insert in a temporary var the id name
		tempId = name

		# Check if there are 2 equal ids
		for i in [0...idArray.length]
			if tempId == idArray[i]
				console.error Errors.sameID
				alert Errors.sameID

		# Insert every id in the array
		idArray.push(tempId)
		console.log idArray

		# Set CSS properties to array elements
		newDiv.style.width = @properties.width
		newDiv.style.height = @properties.height
		newDiv.style.backgroundColor = @properties.backgroundColor
		newDiv.style.position = @properties.position
		# Center the layer
		if @properties.center == 'both'
			screenWidth = $(window).width()
			screenHeight = $(window).height()
			widthInt = parseInt(@properties.width)
			heightInt = parseInt(@properties.height)
			centerX = (screenWidth - widthInt) / 2
			centerY = (screenHeight - heightInt) / 2
			newDiv.style.left = centerX + 'px'
			newDiv.style.top = centerY + 'px'
		else if @properties.center == 'x'
			screenWidth = $(window).width()
			widthInt = parseInt(@properties.width)
			centerX = (screenWidth - widthInt) / 2
			newDiv.style.left = centerX + 'px'
		else if @properties.center == 'y'
			screenWidth = $(window).height()
			heightInt = parseInt(@properties.height)
			centerY = (screenWidth - heightInt) / 2
			newDiv.style.top = centerY + 'px'
		else
			console.error Errors.wrongCenterValue
			#alert Errors.wrongCenterValue
			newDiv.style.left = @properties.x
			newDiv.style.top = @properties.y

		newDiv.style.zIndex = @properties.z
		newDiv.style.borderRadius = @properties.borderRadius
		newDiv.style.boxShadow = @properties.boxShadow

# ----------------------- #
# --- BackgroundLayer --- #
# ----------------------- #
class BackgroundLayer
	# Define layer's properties
	@properties = {
		backgroundColor: @backgroundColor
	}

	constructor: (@name, @properties) ->
		# Get the <body> element and set the property
		body = document.getElementsByTagName('body')[0]
		body.style.backgroundColor = @properties.backgroundColor


# ------------------ #
# --- Try Layers --- #
# ------------------ #
layerA = new Layer 'layerA',
	width: '200px'
	height: '100px'
	backgroundColor: '#efd55a'
	borderRadius: '5px'
	position: 'absolute'
	x: '200px'

layerB = new Layer 'layerB',
	width: '200px'
	height: '100px'
	backgroundColor: '#12ddce'
	borderRadius: '0px'
	position: 'absolute'
	center: 'both'

bgLayer = new BackgroundLayer 'bgLayer',
	backgroundColor: "#fff"

# ------------------ #
# --- Try Events --- #
# ------------------ #
