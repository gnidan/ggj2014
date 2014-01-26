Ghost = require 'entities/ghost'
LifeWalker = require 'entities/walker'
Robot = require 'entities/robot'
Door = require 'entities/door'

tiles =
  tile41: Ghost
  tile42: LifeWalker
  tile43: Robot
  tile144: Door.Ghost
  tile148: Door.Robot
  tile152: Door.Walker


class EntityPlacer
  models: []

  constructor: (level) ->
    positions = level.getEntitiesInLayer('Positions')

    if positions?
      for pos_e in positions
        tile = pos_e.attr('tile')
        console.log tile
        continue unless tile of tiles

        unless tiles[tile] == Door.Robot or
               tiles[tile] == Door.Ghost or
               tiles[tile] == Door.Walker
          model = new tiles[tile](pos_e.x + 30, pos_e.y - 55)
          model.deactivate()

          @models.push model
        else
          door = new tiles[tile](pos_e.x, pos_e.y)
          comp = switch tiles[tile]
            when Door.Robot then 'Door.Robot'
            when Door.Ghost then 'Door.Ghost'
            when Door.Walker then 'Door.Walker'
          door.get('entity').addComponent(comp)

    @models[0].activate()
    

module.exports = EntityPlacer
