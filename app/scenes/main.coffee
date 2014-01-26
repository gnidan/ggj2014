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

  levelURL = '/levels/level.json'
  $.ajax
    type: 'GET'
    url: levelURL
    dataType: 'json'
    data: {}
    async: false
    success: (level) ->
      Crafty.e('2D, Canvas, TiledMapBuilder')
        .setMapDataSource(level)
        .createWorld (tileMap) ->
          for layer in ['Life', 'Ghost', 'Robot']
            entitiesInLayer = tileMap.getEntitiesInLayer("#{layer}Foreground")
            if entitiesInLayer?
              for e in entitiesInLayer
                e.addComponent('MapTile')
                e.addComponent("#{layer}ForegroundTile")


#  
#  TiledMapBuilder.createWorld (map) ->
#    console.log 'yo'


