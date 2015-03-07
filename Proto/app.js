// App.js
// Example app - Edit if you want

var layerA = new Layer('layerA', {
	width: 200,
	height: 200,
	backgroundColor: '#2196F3',
	center: 'both'
}) 

$('#layerA').click(function() {
	layerA.animate('rotateZ', 45, 2000)
})
