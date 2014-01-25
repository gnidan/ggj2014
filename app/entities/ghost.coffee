#It grabs the base entity file and assigns it to the variable base entity
BaseEntity = require 'entities/base' 

class Ghost extends BaseEntity
  initialize: ->
    console.log 'so far so good'
    model = this
    entity = Crafty.e( "2D, Canvas, SpriteAnimation, ghost")
    entity
      .attr
        x: Crafty.viewport.width / 2 - entity.w / 2
        y: 0
        z: 300
      .reel("walking", 500, 0, 0, 4)
      .animate("walking", -1)
      .setName('Ghost')

    entity.origin(entity.w / 2, entity.h / 2)

    model.set
      entity: entity

module.exports = Ghost