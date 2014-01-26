Ghost = require 'entities/ghost'
Robot = require 'entities/robot'
LifeWalker = require 'entities/walker'

Crafty.scene 'main', ->
  Crafty.box2D.init(0, 10, 32, true)
  w = new LifeWalker
 
  floor = Crafty.e('2D, Canvas, Box2D')
    .attr
      isFloor: true
    .setName('Box2D Floor')
    .box2d
      bodyType: 'static'
      shape: [[0, Crafty.viewport.height],
              [Crafty.viewport.width, Crafty.viewport.height]]

  map = Crafty.e("TiledLevel")
  map.tiledLevel("/levels/level.json", "Canvas")
