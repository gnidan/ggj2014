#It grabs the base entity file and assigns it to the variable base entity
BaseEntity = require 'entities/base'
Sprites = require 'sprites'

class LifeWalker extends BaseEntity
  defaults:
    speed: 8
    jump: 15

  initialize: ->
    (new Sprites).create('walker')
    console.log 'so far so good'
    model = this
    entity = Crafty.e( "2D, Canvas, SpriteAnimation, walker, Twoway, Keyboard, Gravity")
    entity
      .attr
        x: Crafty.viewport.width / 2 - entity.w / 2
        y: 0
        z: 300
      .reel("walking", 100, 0, 0, 4)
      .twoway(model.get('speed'), model.get('jump'))
      .setName('Ghost')
      .gravityConst(1)
      .gravity("tile15")
      .bind 'NewDirection', (dir) ->
        if dir.x == 0 and dir.y == 0
          this.pauseAnimation()
        else if dir.x > 0
          this.unflip()
          this.animate('walking', -1)
        else if dir.x < 0
          this.flip('X')
          this.animate('walking', -1)



    entity.origin(entity.w / 2, entity.h / 2)

    model.set
      entity: entity

module.exports = LifeWalker
