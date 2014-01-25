#It grabs the base entity file and assigns it to the variable base entity
BaseEntity = require 'entities/base'

class Ghost extends BaseEntity
  defaults:
    speed: 8
    jump: 15

  initialize: ->
    console.log 'so far so good'
    model = this
    entity = Crafty.e( "2D, Canvas, SpriteAnimation, ghost, Twoway, Keyboard, Gravity")
    entity
      .attr
        x: Crafty.viewport.width / 2 - entity.w / 2
        y: 0
        z: 300
      .reel("walking", 500, 0, 0, 4)
      .twoway(model.get('speed'), model.get('jump'))
      .animate("walking", -1)
      .setName('Ghost')
      .gravityConst(2)
      .gravity("tile15")
	  

    entity.origin(entity.w / 2, entity.h / 2)

    model.set
      entity: entity

module.exports = Ghost
