// App.js
// Example app - Edit if you want

var layerA = new Layer('layerA', {
	width: 300,
	height: 300,
	backgroundColor: '#03A9F4',
	center: 'both'
})

layerA.animate({ 
	width: 100,
	height: 200, 
	backgroundColor: '#009688',
	rotateZ: 45
}, 2)
