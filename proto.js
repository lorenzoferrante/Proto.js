// Lorenzo Ferrante © 2015
// Proto.js
// v. 1.0.1

// Get <body> 
var body = document.getElementsByTagName("body")[0];

// Create new Layer, <div> in html
function Layer(name) {
	// The name must be unique for every layer
	this.name = name
	// Create a new div with unique id
    this.create = function() {
    	newDiv = document.createElement("div")
    	document.body.appendChild(newDiv)
    	newDiv.id = name
    },
    // Define width
    this.width = function(width) {
    	newDiv.style.width = width
    	return width
    },
    // Define heigth
    this.height = function(height) {
    	newDiv.style.height = height
    	return height
    },
    // Define background-color
    this.backgroundColor = function(bgColor) {
    	newDiv.style.backgroundColor = bgColor
    	return bgColor
    },
    // Define position
    this.position = function(position) {
    	newDiv.style.position = position
    	return position
    },
    // Define x position
    this.x = function(x) {
    	newDiv.style.left = x
    	return x
    },
    // Define y position
    this.y = function(y) {
    	newDiv.style.top = y
    	return y
    },
    // Define border-radius
    this.borderRadius = function(borderRadius) {
    	newDiv.style.borderRadius = borderRadius
    	return borderRadius
    }
    // Define text
    this.text = function(text) {
        document.getElementById(name).innerHTML = text
        return text
    },
    // Define font-family
    this.fontFamily = function(fontFamily) {
        newDiv.style.fontFamily = fontFamily
        return fontFamily
    }
}

// Create new BackgroundLayer, <body> in html
function BackgroundLayer(name) {
	this.name = name
	// Get the <body> element
    this.body = function() {
    	body.id = name
    },
	this.bgColor = function(bgColor) {
	   	body.style.backgroundColor = bgColor
	  	return bgColor
	}
}
