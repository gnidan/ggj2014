Ghost = require 'entities/ghost'
Robot = require 'entities/robot'
LifeWalker = require 'entities/walker'

Switcher = require 'switcher'
EntityPlacer = require 'entity_placer'

Crafty.scene 'main', ->
  Crafty.box2D.init(0, 10, 32, true)
 
  floor = Crafty.e('2D, Canvas, Box2D')
    .attr
      isFloor: true
    .setName('Box2D Floor')
    .box2d
      bodyType: 'static'
      shape: [[0, Crafty.viewport.height],
              [Crafty.viewport.width, Crafty.viewport.height]]

  levelURL = 'levels/tinylevel.json'
  $.ajax
    type: 'GET'
    url: levelURL
    dataType: 'json'
    data: {}
    async: false
    success: (levelData) ->
      level = null
      selector = null

      Crafty.e('2D, Canvas, TiledMapBuilder')
        .setMapDataSource(levelData)
        .createWorld (tileMap) ->
          level = tileMap
          selector = _.bind(tileMap.getEntitiesInLayer, tileMap)

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
              e.visible = false

      ep = new EntityPlacer(level)
      s = new Switcher(ep.models, selector)


#  
#  TiledMapBuilder.createWorld (map) ->
#    console.log 'yo'


