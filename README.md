# ![logo02](https://cloud.githubusercontent.com/assets/1908782/6528859/352a62a0-c425-11e4-8eab-fe532ab03beb.png)

<b>Proto.js</b> is a JavaScript framework for quickly create web pages, animations and interactions. With Proto.js you can define animations with the integration with Velocity.js, that is similar to jQuery but faster.

The framework is written in Coffeescript, an upgraded and more legible version of Javascript. You can code it in both languages.

I've been inspired by the great <a href="https://github.com/koenbok/Framer">Framer.js</a>

## ![start](https://cloud.githubusercontent.com/assets/1908782/6541184/4e91e2e2-c4c3-11e4-8b07-7c97324ba3e2.png)
* Download Proto.js folder
* Edit app.js (add layers and animations)
* Open index.html in your browser

![folder](https://cloud.githubusercontent.com/assets/1908782/6541201/42737bfa-c4c4-11e4-8985-bab768bd56a3.png)

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
- position -> <code>'absolute</code> or <code>'relative</code> or <code>'fixed'</code>
- x (left) -> <code>20</code>
- y (top) -> <code>0</code>
- z (z-index) -> <code>11</code>
- borderRadius -> <code>30</code>
- boxShadow -> <code>'2px 1px 10px 4px rgba(0,0,0,0.3)'</code>
- center -> <code>'both'</code> or <code>'x'</code> or <code>'y'</code>
- image -> <code>'cat.png'</code>
- visible -> <code>true</code> or </code>false</code>
- opacity -> <code>0.5</code>
- scale -> <code>1.5</code>
    <br/><b>WARNING:</b> Note that the <code>scale</code> property doesn't work if layer has animations. Use this animation instead: <code>layer.animate('scale', 2, 2000)</code>

## ![events](https://cloud.githubusercontent.com/assets/1908782/6529069/897e4b36-c426-11e4-87d2-c3d7e03aea94.png)

Now let's talk about animations and events. I decided to use Velocity.js instead of jQuery for its better performance and speed. It's very simple to implement an event. Below the list of the possible (for the moment) animations, and how to use them.

```javascript
/* -- SYNTAX -- */
layer.animate(animation_name, animation_property, animation_duration)
/* -- EXAMPLE -- */
layerA.animate('x', 200, 2000)
layerB.animate('rotateY', 80, 1000)
layerB.animate('backgroundColor', '#ff00ff', 750)
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
- scale

<!--[layers](https://cloud.githubusercontent.com/assets/1908782/6525190/d9ca43a2-c402-11e4-8a43-df73467d71a9.png)
[layers01](https://cloud.githubusercontent.com/assets/1908782/6525207/0c32e36c-c403-11e4-9616-d2dd00e290d0.png)
[layers02](https://cloud.githubusercontent.com/assets/1908782/6525215/2979f618-c403-11e4-824c-d2e2fba7fd51.png)-->

## ![beta](https://cloud.githubusercontent.com/assets/1908782/6536460/0e7d79d4-c44e-11e4-91d2-86d4dc709bb1.png)

Note that <b>Proto.js</b> is currently in Beta version, so if you're using it, probably not everythink will work. However everyday I'm working to improve this amazing and open-source framework. Hope you liked it. Let me know if there's something wrong with the code. 
Thank you.

Inspiration: <a href="https://github.com/koenbok/Framer">Framer.js</a><br/>
Author: <a href="https://github.com/lorenzoferrante" target="_blank">Lorenzo Ferrante</a>


