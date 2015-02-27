# Lorenzo Ferrante © 2015
# Proto.js
# v. 1.5.0

# ------------- #
# --- Layer --- #
# ------------- #
class Layer
	# Define layer's properties
	@properties = {
		width: @width,
		height: @height,
		backgroundColor: @backgroundColor,
		position: @position,
		x: @x,
		y: @y,
		borderRadius: @borderRadius
	}

	constructor: (@name, @properties) ->
		# Create new <div> element
		newDiv = document.createElement 'div' 
		document.body.appendChild newDiv
		newDiv.id = @name

		# Set CSS properties to array elements
		newDiv.style.width = @properties.width
		newDiv.style.height = @properties.height
		newDiv.style.backgroundColor = @properties.backgroundColor
		newDiv.style.position = @properties.position
		newDiv.style.left = @properties.x
		newDiv.style.top = @properties.y
		newDiv.style.borderRadius = @properties.borderRadius

# ----------------------- #
# --- BackgroundLayer --- #
# ----------------------- #
class BackgroundLayer
	# Define layer's properties
	@properties = {
		backgroundColor: @backgroundColor,
	}

	constructor: (@name, @properties) ->
		# Create new <div> element
		body = document.getElementsByTagName('body')[0]
		body.style.backgroundColor = @properties.backgroundColor


# ----------------- #
# --- New Layer --- #
# ----------------- #
layerA = new Layer 'layerA',
	width: '200px'
	height: '100px'
	backgroundColor: '#123456'
	position: 'absolute'
	x: '100px'
	y: '200px'
	borderRadius: '20px'

bgLayer = new BackgroundLayer 'bgLayer',
	backgroundColor: "#ddd"
