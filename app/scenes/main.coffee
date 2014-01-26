Ghost = require 'entities/ghost'
Robot = require 'entities/robot'
LifeWalker = require 'entities/walker'

Switcher = require 'switcher'

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

  levelURL = '/levels/halfheight2.json'
  $.ajax
    type: 'GET'
    url: levelURL
    dataType: 'json'
    data: {}
    async: false
    success: (level) ->
      s = new Switcher
      Crafty.e('2D, Canvas, TiledMapBuilder')
        .setMapDataSource(level)
        .createWorld (tileMap) ->
          for layer in ['Life', 'Ghost', 'Robot']
            
            entitiesInLayer = tileMap.getEntitiesInLayer("#{layer}Foreground")
            if entitiesInLayer?
              for e in entitiesInLayer
                e.addComponent('MapTile')
                e.addComponent("#{layer}ForegroundTile")

          ghostLayerEntities = tileMap.getEntitiesInLayer('GhostForeground')
          if ghostLayerEntities?
            for e in ghostLayerEntities
              e.visible = false

          positionEntities = tileMap.getEntitiesInLayer('Positions')
          if positionEntities?
            for e in positionEntities
              console.log e


#  
#  TiledMapBuilder.createWorld (map) ->
#    console.log 'yo'


