Ghost = require 'entities/ghost'
Crafty.scene 'main', ->
  Crafty.box2D.init(0, 10, 32, true)
  g = new Ghost
 
  floor = Crafty.e('2D, Canvas, Box2D')
    .attr
      isFloor: true
    .setName('Box2D Floor')
    .box2d
      bodyType: 'static'
      shape: [[0, Crafty.viewport.height],
              [Crafty.viewport.width, Crafty.viewport.height]]

  map = Crafty.e("TiledLevel")
  map.tiledLevel("/levels/test.json", "Canvas")
