# ![logo](https://cloud.githubusercontent.com/assets/1908782/6525293/2ccbe0e6-c404-11e4-996d-94939d691277.png)

<b>Proto.js</b> is a JavaScript framework for quickly create web pages, animations and interactions. With Proto.js you can define animations with the integration with Velocity.js, that is similar to jQuery but faster. It's bundled with Framer Generator, an application that allows you to import layers directly out of Photoshop and Sketch.

I am currently working on a Mac app built on top of Proto.js. The framework is written in Coffeescript, an upgraded and more legible version of Javascript. You can code it in both languages.

Inspired by <a href="https://github.com/koenbok/Framer">Framer.js</a>

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

Here is some examples:

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

<!--[layers](https://cloud.githubusercontent.com/assets/1908782/6525190/d9ca43a2-c402-11e4-8a43-df73467d71a9.png)
[layers01](https://cloud.githubusercontent.com/assets/1908782/6525207/0c32e36c-c403-11e4-9616-d2dd00e290d0.png)
[layers02](https://cloud.githubusercontent.com/assets/1908782/6525215/2979f618-c403-11e4-824c-d2e2fba7fd51.png)-->




