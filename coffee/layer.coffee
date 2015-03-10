# ---------------- TO DO'S ---------------- #
# - Add Text layer
# - Correct center property for superlayer
# ----------------------------------------- #

# ------- A U T H O R -------
# ---------------------------
# - Lorenzo Ferrante © 2015 -
# --------- Proto.js --------
# --------- v. 1.7.0 --------
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
	wrongCenterValue: 'You inserted a wrong value for the center
			properties. Please check it. The only possibilities
			are: x, y, both.'
	wrongVisibleValue: 'Please insert in layers declaration the visible property
			for correctness.'
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

# -------------------- #
# --- Gloabal Vars --- #
# -------------------- #
screenWidth = window.innerWidth
screenHeight = $(document).height()

linear = [0, 0, 1, 1]
ease = [.25, .1, .25, 1]
easeIn = [.42, 0, 1, 1]
easeOut = [0, 0, .58, 1]
easeInOut = [.42, 0, .58, 1]
easeReverse = [0, .99, 1, .01]

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
		visible: @visible
		opacity: @opacity
		scale: @scale
	}

	constructor: (@name, @properties) ->
		# Create new <div> element
		window.newDiv = document.createElement 'div' 
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
		newDiv.style.position = 'absolute'
		# Center the layer
		if @properties.center == 'both'
			screenWidth = $(window).width()
			screenHeight = $(window).height()
			widthInt = parseInt(@properties.width)
			heightInt = parseInt(@properties.height)
			centerX = (screenWidth - widthInt) / 2
			centerY = (screenHeight - heightInt) / 2
			newDiv.style.position = 'absolute'
			newDiv.style.left = centerX + 'px'
			newDiv.style.top = centerY + 'px'
		else if @properties.center == 'x'
			screenWidth = $(window).width()
			widthInt = parseInt(@properties.width)
			centerX = (screenWidth - widthInt) / 2
			newDiv.style.position = 'absolute'
			newDiv.style.left = centerX + 'px'
			newDiv.style.top = (@properties.y) + 'px'
		else if @properties.center == 'y'
			screenWidth = $(window).height()
			heightInt = parseInt(@properties.height)
			centerY = (screenWidth - heightInt) / 2
			newDiv.style.position = 'absolute'
			newDiv.style.top = centerY + 'px'
			newDiv.style.left = (@properties.x) + 'px'
		else
			#console.error Errors.wrongCenterValue
			#alert Errors.wrongCenterValue
			newDiv.style.left = (@properties.x) + 'px'
			newDiv.style.top = (@properties.y) + 'px'

		newDiv.style.zIndex = (@properties.z) + 'px'
		newDiv.style.borderRadius = (@properties.borderRadius) + 'px'
		newDiv.style.boxShadow = @properties.boxShadow
		newDiv.style.backgroundImage = 'url(' + @properties.image + ')'

		# Visible property
		if @properties.visible == true
			newDiv.style.visibility = 'visible'
		if @properties.visible == false
			newDiv.style.visibility = 'hidden'
		if @properties.visible != true and @properties.visible != false
			console.warn Errors.wrongVisibleValue

		newDiv.style.opacity = @properties.opacity
		newDiv.style.transform = 'scale(' + @properties.scale + ')'

	# Animations
	animates: (event, x, time, curve) ->
		switch event
			when 'opacity'
				$('#' + @name).velocity({ opacity: x }, time, curve)
				console.log 'Velocity Event: ' + event
			when 'top'
				$('#' + @name).velocity({ top: x + 'px' }, time, curve)
				console.log 'Velocity Event: ' + event
			when 'bottom'
				$('#' + @name).velocity({ bottom: x + 'px' }, time, curve)
				console.log 'Velocity Event: ' + event
			when 'x'
				$('#' + @name).velocity({ left: x + 'px' }, time, curve)
				console.log 'Velocity Event: ' + event
			when 'y'
				$('#' + @name).velocity({ right: x + 'px' }, time, curve)
				console.log 'Velocity Event: ' + event
			when 'translateX'
				$('#' + @name).velocity({ translateX: x }, time, curve)
				console.log 'Velocity Event: ' + event
			when 'translateY'
				$('#' + @name).velocity({ translateY: x }, time, curve)
				console.log 'Velocity Event: ' + event
			when 'rotateZ'
				$('#' + @name).velocity({ rotateZ: x }, time, curve)
				console.log 'Velocity Event: ' + event
			when 'rotateX'
				$('#' + @name).velocity({ rotateX: x }, time, curve)
				console.log 'Velocity Event: ' + event
			when 'rotateY'
				$('#' + @name).velocity({ rotateY: x }, time, curve)
				console.log 'Velocity Event: ' + event
			when 'width'
				$('#' + @name).velocity({ width: x }, time, curve)
				console.log 'Velocity Event: ' + event
			when 'height'
				$('#' + @name).velocity({ height: x }, time, curve)
				console.log 'Velocity Event: ' + event
			when 'backgroundColor'
				$('#' + @name).velocity({ backgroundColor: x }, time, curve)
				console.log 'Velocity Event: ' + event
			when 'borderRadius'
				$('#' + @name).velocity({ borderRadius: x }, time, curve)
				console.log 'Velocity Event: ' + event
			when 'boxShadow'
				$('#' + @name).velocity({ boxShadow: x }, time, curve)
				console.log 'Velocity Event: ' + event
			when 'scale'
				$('#' + @name).velocity({ scale: x }, time, curve)
				console.log 'Velocity Event: ' + event

	# Animations
	@animation = {
		width: @width
		height: @height
		opacity: @opacity
		top: @top
		bottom: @bottom
		left: @x
		right: @y
		rotateX: @rotateX
		rotateY: @rotateY
		rotateZ: @rotateZ
		backgroundColor: @backgroundColor
		borderRadius: @borderRadius
		boxShadow: @boxShadow
		scale: @scale
	}

	animate: (@animation, time, curve) ->
		$layer = $('#' + @name)

		animationSequence = [
		  { elements: $layer, properties: { width: @animation.width, 
		  height: @animation.height,
		  opacity: @animation.opacity,
		  top: @animation.top,
		  bottom: @animation.bottom,
		  left: @animation.left,
		  right: @animation.right,
		  rotateX: @animation.rotateX,
		  rotateY: @animation.rotateY,
		  rotateZ: @animation.rotateZ,
		  backgroundColor: @animation.backgroundColor,
		  borderRadius: @animation.borderRadius,
		  boxShadow: @animation.boxShadow,
		  scale: @animation.scale }, options: { duration: (time * 1000), easing: curve } }
		]

		$.Velocity.RunSequence(animationSequence);

	# Edit properties			
	edit: (@properties) ->
		child = document.getElementById(@name)

		# Set CSS properties
		child.style.width = (@properties.width) + 'px'
		child.style.height = (@properties.height) + 'px'
		child.style.backgroundColor = @properties.backgroundColor
		child.style.position = @properties.position
		# Center the layer
		if @properties.center == 'both'
			screenWidth = $(window).width()
			screenHeight = $(window).height()
			widthInt = parseInt(@properties.width)
			heightInt = parseInt(@properties.height)
			centerX = (screenWidth - widthInt) / 2
			centerY = (screenHeight - heightInt) / 2
			child.style.position = 'absolute'
			child.style.left = centerX + 'px'
			child.style.top = centerY + 'px'
		else if @properties.center == 'x'
			screenWidth = $(window).width()
			widthInt = parseInt(@properties.width)
			centerX = (screenWidth - widthInt) / 2
			child.style.position = 'absolute'
			child.style.left = centerX + 'px'
			child.style.top = (@properties.y) + 'px'
		else if @properties.center == 'y'
			screenWidth = $(window).height()
			heightInt = parseInt(@properties.height)
			centerY = (screenWidth - heightInt) / 2
			child.style.position = 'absolute'
			child.style.top = centerY + 'px'
			child.style.left = (@properties.x) + 'px'
		else
			#console.error Errors.wrongCenterValue
			#alert Errors.wrongCenterValue
			child.style.left = (@properties.x) + 'px'
			child.style.top = (@properties.y) + 'px'

		child.style.zIndex = (@properties.z) + 'px'
		child.style.borderRadius = (@properties.borderRadius) + 'px'
		child.style.boxShadow = @properties.boxShadow
		child.style.backgroundImage = 'url(' + @properties.image + ')'

		# Visible property
		if @properties.visible == true
			child.style.visibility = 'visible'
		if @properties.visible == false
			child.style.visibility = 'hidden'
		if @properties.visible != true and @properties.visible != false
			console.warn Errors.wrongVisibleValue

		child.style.opacity = @properties.opacity
		child.style.transform = 'scale(' + @properties.scale + ')'

	# Delete layer - make it hidden
	delete: () ->
		document.getElementById(@name).style.visibility = 'hidden'

	# Layer's hierachy
	superLayer: (parent) ->
		parentID = document.getElementById('' + parent.toString()) 
		$(parentID).append($('#' + @name))
		child = document.getElementById('' + @name)
		child.style.position = 'relative'


# ----------------------- #
# --- BackgroundLayer --- #
# ----------------------- #
class BackgroundLayer
	# Define layer's properties
	@properties = {
		backgroundColor: @backgroundColor,
		image: @image
	}

	constructor: (@properties) ->
		# Get the <body> element and set the property
		body = document.getElementsByTagName('body')[0]
		body.style.backgroundColor = @properties.backgroundColor
		body.style.backgroundImage = 'url(' + @properties.image + ')'

