BaseEntity = require 'entities/base'

class Door extends BaseEntity
  sprite: 'mech_door'
  initialize: (x, y, comp) ->
    super

    model = this
    comps = "2D, Canvas, SpriteAnimation, #{@sprite}, Keyboard, Gravity, Collision"
    entity = Crafty.e(comps)
    entity
      .attr
        x: x
        y: y
        z: 200
      .reel('activate', 100, 0, 0, 2)
      .reel('deactivate', 100, [[0, 0]])

    @set 'entity', entity

  activate: ->
    @get('entity').animate('activate')

  deactivate: ->
    @get('entity').animate('deactivate')


class Door.Robot extends Door
  sprite: 'mech_door'

class Door.Ghost extends Door
  sprite: 'ghost_door'

class Door.Walker extends Door
  sprite: 'walker_door'

module.exports = Door
