// Generated by CoffeeScript 1.8.0
(function() {
  var BackgroundLayer, Detect, Errors, Layer, Utils, bgLayer, dimensions, idArray, layerA, layerB, onAnimationEnd, onAnimationStart, onAnimationStop, onClick, onMouseMove, onMouseOut, onMouseOver, onScroll, onTouchEnd, onTouchMove, onTouchStart;

  require(['./js/jquery.min'], function(dependency) {});

  dimensions = function() {
    var screenHeight, screenWidth;
    screenWidth = $(window).width();
    return screenHeight = $(window).height();
  };

  $(window).resize(function() {
    dimensions();
    return location.reload();
  });

  Errors = {
    sameID: 'Two div have the same id! Change the name in the layer declaration.',
    wrongCenterValue: 'You inserted a wrong value for the center properties. Please check it. The only possibilities are: x, y, both.'
  };

  Detect = {};

  Utils = {};

  Utils.deviceType = function() {
    if (/(mobi)/i.test(navigator.userAgent)) {
      return "phone";
    }
    if (/(tablet)|(iPad)/i.test(navigator.userAgent)) {
      return "tablet";
    }
    return "desktop";
  };

  Detect.isChrome = function() {
    return /chrome/.test(navigator.userAgent.toLowerCase());
  };

  Detect.isSafari = function() {
    return /safari/.test(navigator.userAgent.toLowerCase());
  };

  Detect.isTouch = function() {
    return window.ontouchstart === null;
  };

  Detect.isDesktop = function() {
    return Utils.deviceType() === "desktop";
  };

  Detect.isPhone = function() {
    return Utils.deviceType() === "phone";
  };

  Detect.isTablet = function() {
    return Utils.deviceType() === "tablet";
  };

  if (Detect.isChrome()) {
    console.log('Using Chorme');
  }

  if (Detect.isSafari()) {
    console.log('Using Safari');
  }

  if (Detect.isTouch()) {
    console.log('Using Touch device');
  }

  if (Detect.isDesktop()) {
    console.log('Using Desktop browser');
  }

  if (Detect.isPhone()) {
    console.log('Using Phone');
  }

  if (Detect.isTablet()) {
    console.log('Using Tablet');
  }

  if (Detect.isTouch()) {
    onTouchStart = "touchstart";
    onTouchEnd = "touchend";
    onTouchMove = "touchmove";
  } else {
    onTouchStart = "mousedown";
    onTouchEnd = "mouseup";
    onTouchMove = "mousemove";
  }

  onClick = onTouchEnd;

  onMouseOver = "mouseover";

  onMouseOut = "mouseout";

  onMouseMove = "mousemove";

  onAnimationStart = "start";

  onAnimationStop = "stop";

  onAnimationEnd = "end";

  onScroll = "scroll";

  idArray = [];

  Layer = (function() {
    Layer.properties = {
      width: Layer.width,
      height: Layer.height,
      backgroundColor: Layer.backgroundColor,
      position: Layer.position,
      x: Layer.x,
      y: Layer.y,
      z: Layer.z,
      borderRadius: Layer.borderRadius,
      boxShadow: Layer.boxShadow,
      center: Layer.center
    };

    function Layer(name, properties) {
      var centerX, centerY, heightInt, i, newDiv, screenHeight, screenWidth, tempId, widthInt, _i, _ref;
      this.name = name;
      this.properties = properties;
      newDiv = document.createElement('div');
      document.body.appendChild(newDiv);
      newDiv.id = name;
      tempId = name;
      for (i = _i = 0, _ref = idArray.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        if (tempId === idArray[i]) {
          console.error(Errors.sameID);
          alert(Errors.sameID);
        }
      }
      idArray.push(tempId);
      console.log(idArray);
      newDiv.style.width = this.properties.width;
      newDiv.style.height = this.properties.height;
      newDiv.style.backgroundColor = this.properties.backgroundColor;
      newDiv.style.position = this.properties.position;
      if (this.properties.center === 'both') {
        screenWidth = $(window).width();
        screenHeight = $(window).height();
        widthInt = parseInt(this.properties.width);
        heightInt = parseInt(this.properties.height);
        centerX = (screenWidth - widthInt) / 2;
        centerY = (screenHeight - heightInt) / 2;
        newDiv.style.left = centerX + 'px';
        newDiv.style.top = centerY + 'px';
      } else if (this.properties.center === 'x') {
        screenWidth = $(window).width();
        widthInt = parseInt(this.properties.width);
        centerX = (screenWidth - widthInt) / 2;
        newDiv.style.left = centerX + 'px';
      } else if (this.properties.center === 'y') {
        screenWidth = $(window).height();
        heightInt = parseInt(this.properties.height);
        centerY = (screenWidth - heightInt) / 2;
        newDiv.style.top = centerY + 'px';
      } else {
        console.error(Errors.wrongCenterValue);
        newDiv.style.left = this.properties.x;
        newDiv.style.top = this.properties.y;
      }
      newDiv.style.zIndex = this.properties.z;
      newDiv.style.borderRadius = this.properties.borderRadius;
      newDiv.style.boxShadow = this.properties.boxShadow;
    }

    return Layer;

  })();

  BackgroundLayer = (function() {
    BackgroundLayer.properties = {
      backgroundColor: BackgroundLayer.backgroundColor
    };

    function BackgroundLayer(name, properties) {
      var body;
      this.name = name;
      this.properties = properties;
      body = document.getElementsByTagName('body')[0];
      body.style.backgroundColor = this.properties.backgroundColor;
    }

    return BackgroundLayer;

  })();

  layerA = new Layer('layerA', {
    width: '200px',
    height: '100px',
    backgroundColor: '#efd55a',
    borderRadius: '5px',
    position: 'absolute',
    x: '200px'
  });

  layerB = new Layer('layerB', {
    width: '200px',
    height: '100px',
    backgroundColor: '#12ddce',
    borderRadius: '0px',
    position: 'absolute',
    center: 'both'
  });

  bgLayer = new BackgroundLayer('bgLayer', {
    backgroundColor: "#fff"
  });

}).call(this);