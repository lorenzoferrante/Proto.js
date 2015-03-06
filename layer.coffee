# ---------------- TO DO'S ---------------- #
# - Use Velocity.js for animations 
# ✓ Don't create a layer with the same id
# - Edit layer's properties inside functions
# - Automatically set the var name as the id
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
require ['./js/velocity.min'], (dependency) ->

# Reload window on resize
$(window).resize ->
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
	(/chrom(e|ium)/).test(navigator.userAgent.toLowerCase())

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
		width: @width
		height: @height
		backgroundColor: @backgroundColor
		position: @position
		x: @x
		y: @y
		z: @z
		borderRadius: @borderRadius
		boxShadow: @boxShadow
		center: @center
		image: @image
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
				document.getElementById('error').style.visibility = 'visible'

		# Insert every id in the array
		idArray.push(tempId)
		console.log idArray

		# Set CSS properties
		newDiv.style.width = (@properties.width).toString() + 'px'
		newDiv.style.height = (@properties.height).toString() + 'px'
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
			#console.error Errors.wrongCenterValue
			#alert Errors.wrongCenterValue
			newDiv.style.left = (@properties.x) + 'px'
			newDiv.style.top = (@properties.y) + 'px'

		newDiv.style.zIndex = (@properties.z) + 'px'
		newDiv.style.borderRadius = (@properties.borderRadius) + 'px'
		newDiv.style.boxShadow = @properties.boxShadow
		newDiv.style.backgroundImage = 'url(' + @properties.image + ')'

# ----------------------- #
# --- BackgroundLayer --- #
# ----------------------- #
class BackgroundLayer
	# Define layer's properties
	@properties = {
		backgroundColor: @backgroundColor,
		image: @image
	}

	constructor: (@name, @properties) ->
		# Get the <body> element and set the property
		body = document.getElementsByTagName('body')[0]
		body.style.backgroundColor = @properties.backgroundColor
		body.style.backgroundImage = 'url(' + @properties.image + ')'
