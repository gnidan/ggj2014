BaseEntity = require 'entities/base'
Complete = require 'entities/complete'

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
    .bind 'AnimationEnd', ->
      Door.activatedSoFar += 1
      if Door.activatedSoFar == 3
        new Complete(x, y)

    @set 'entity', entity

  @activatedSoFar = 0
  
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
