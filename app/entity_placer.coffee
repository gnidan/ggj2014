Ghost = require 'entities/ghost'
LifeWalker = require 'entities/walker'
Robot = require 'entities/robot'

tiles =
  tile43: Robot
  tile41: Ghost
  tile42: LifeWalker

class EntityPlacer
  models: []

  constructor: (level) ->
    positions = level.getEntitiesInLayer('Positions')

    if positions?
      for pos_e in positions
        tile = pos_e.attr('tile')
        model = new tiles[tile](pos_e.x + 30, pos_e.y - 55)
        model.deactivate()

        @models.push model

    @models[0].activate()
    

module.exports = EntityPlacer
