BaseEntity = require 'entities/base'

class Vine extends BaseEntity
  initialize: (x, y) ->
    super

    model = this
    comps = "2D, Canvas, SpriteAnimation, vine, Keyboard, Gravity, Collision"
    entity = Crafty.e(comps)
    entity
      .attr
        x: x
        y: y
        z: 299
      .reel('growth', 1000, 0, 0, 10)
      .bind 'AnimationEnd', ->
        @addComponent 'MapTile'
      .animate('growth')


    @set 'entity', entity

module.exports = Vine
