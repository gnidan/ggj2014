#It grabs the base entity file and assigns it to the variable base entity
BaseEntity = require 'entities/base'
Sprites = require 'sprites'

class PlayerEntity extends BaseEntity
  defaults:
    speed: 8
    jump: 15
    comp: 'player'
    name: 'player_entity'

  initialize: ->
    (new Sprites).create()
    model = this
    comps = "2D, Canvas, SpriteAnimation, #{model.get('comp')}, Twoway, Keyboard, Gravity, Collision"
    entity = Crafty.e(comps)
    entity
      .attr
        x: Crafty.viewport.width / 2 - entity.w / 2
        y: Crafty.viewport.height
        z: 300
      .reel("walking", 100, 0, 0, 4)
      .twoway(model.get('speed'), model.get('jump'))
      .setName(model.get('name'))
      .gravityConst(1)
      .gravity("MapTile")
      .bind 'NewDirection', (dir) ->
        if dir.x == 0 and dir.y == 0
          this.pauseAnimation()
        else if dir.x > 0
          this.unflip()
          this.animate('walking', -1)
        else if dir.x < 0
          this.flip('X')
          this.animate('walking', -1)
      .onHit 'MapTile', (comps) ->
        this.x -= this._movement.x
        this.y -= this._movement.y
        this._up = false

    entity.origin(entity.w / 2, entity.h / 2)
    Crafty.viewport.follow(entity, 0, 0)

    model.set
      entity: entity

module.exports = PlayerEntity
