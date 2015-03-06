# ![logo02](https://cloud.githubusercontent.com/assets/1908782/6528859/352a62a0-c425-11e4-8eab-fe532ab03beb.png)

<b>Proto.js</b> is a JavaScript framework for quickly create web pages, animations and interactions. With Proto.js you can define animations with the integration with Velocity.js, that is similar to jQuery but faster. It's bundled with Framer Generator, an application that allows you to import layers directly out of Photoshop and Sketch.

I am currently working on a Mac app built on top of Proto.js. The framework is written in Coffeescript, an upgraded and more legible version of Javascript. You can code it in both languages.

Inspired by the great <a href="https://github.com/koenbok/Framer">Framer.js</a>

## ![usage](https://cloud.githubusercontent.com/assets/1908782/6525384/3c5a0230-c405-11e4-8a60-d563c9f97e4c.png)
Using Proto.js is very simple. It is based on layers that are like html <code>div</code>. You have lots of properties you can define. Here is an example of how to create a new layer:

```javascript
layerA = new Layer('layerA', {
    width: 200,
    height: 100,
    backgroundColor: '#efd55a',
    borderRadius: 5,
    position: 'absolute',
    x: 200
  });
```

Using the keyword <code>new</code>, the framework create a new layer with all the properties you declared. Before declaring properties, you must have to name the layer. The layer's name is also its html <code>id</code>, so you will be able to access it later with transitions and animations. Here's what the code above creates in the html page:

```html
<div id="layerA" style="width: 200px; height: 100px; position: absolute; left: 200px; border-radius: 5px; background-color: rgb(239, 213, 90);"></div>
```

There is also a <code>BackgroundLayer</code> that is similar to html <code>body</code> tag. Its properties are <code>backgroundColor</code> and <code>image</code>. The second sets the image as a backround-image. When declaring it, you doesn't need to specific the layer's name. Here is an example declaration:

```javascript
// Create a BackgroundLayer
layerA = new BackgroundLayer({
    backgroundColor: '#fff',
    image: 'nature.png'
});
```

Now let's see some other layer's declaration examples:

```javascript
// Create a layer and center it
layerA = new Layer('layerA', {
    width: 200,
    height: 100,
    center: 'both'
  });
```

With <code>center: 'both'</code> you told the framework to center horizontally and vertically the layer. There are 3 possible ways to center a layer:
- <code>center: 'x'</code> that center it only horizontally
- <code>center: 'y'</code> that center it only vertically
- <code>center: 'both'</code> that center it both vertically and horizontally

With <code>edit()</code> function you can easily change layer's properties after declaration. Here is an example:

```javascript
layerA = new Layer('layerA', {
    width: 200,
    height: 100,
    center: 'both'
  });
  
// Change 'center' and 'width' property
layerA.edit('center', 'x');
layerA.edit('width', 300);
```

With <code>delete()</code> function you can delete a layer, or rather set its CSS visibility to hidden. Let's do an other example:

```javascript
layerA = new Layer('layerA', {
    width: 200,
    height: 100,
    center: 'both'
  });
  
// Delete layerA
layerA.delete();
```
## ![properties](https://cloud.githubusercontent.com/assets/1908782/6535029/27edbade-c442-11e4-836c-99f0e97780d1.png)

Let's see what are the available properties for the moment:
- property -> example

- width -> <code>230</code>
- height -> <code>100</code>
- backgroundColor -> <code>'#ff32ee'</code>
- position -> <code>'absolute</code> & <code>'relative</cod> & <code>'fixed'</code>
- x (left) -> <code>20</code>
- y (top) -> <code>0</code>
- z (z-index) -> <code>11</code>
- borderRadius -> <code>30</code>
- boxShadow -> <code>'2px 1px 10px 4px rgba(0,0,0,0.3)'</code>
- center -> <code>'both'</code> & <code>'x'</code> & <code>'y'</code>
- image -> <code>'cat.png'</code>

## ![events](https://cloud.githubusercontent.com/assets/1908782/6529069/897e4b36-c426-11e4-87d2-c3d7e03aea94.png)

Now let's talk about animations and events. I decided to use Velocity.js instead of jQuery for its better performance and speed. It's very simple to implement an event. Below the list of the possible (for the moment) animations, and how to use them.

```javascript
/* -- SYNTAX -- */
layer.events(eventName, property, duration)
/* -- EXAMPLE -- */
layerA.events('x', 200, 2000)
layerB.events('rotateY', 80, 1000)
layerB.events('backgroundColor', '#ff00ff', 750)
```

Here's the list of event's name (updated continuously) :
- opacity
- top
- bottom
- x
- y
- translateX
- translateY
- rotateX
- rotateY
- rotateZ
- width
- height
- backgroundColor
- borderRadius
- boxShadow

<!--[layers](https://cloud.githubusercontent.com/assets/1908782/6525190/d9ca43a2-c402-11e4-8a43-df73467d71a9.png)
[layers01](https://cloud.githubusercontent.com/assets/1908782/6525207/0c32e36c-c403-11e4-9616-d2dd00e290d0.png)
[layers02](https://cloud.githubusercontent.com/assets/1908782/6525215/2979f618-c403-11e4-824c-d2e2fba7fd51.png)-->




