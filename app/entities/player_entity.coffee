#It grabs the base entity file and assigns it to the variable base entity
BaseEntity = require 'entities/base'
Sprites = require 'sprites'
require 'components/movement'

class PlayerEntity extends BaseEntity
  defaults:
    speed: 8
    jump: 15
    comp: 'player'
    name: 'player_entity'
    gravityConst: 1

  initialize: ->
    (new Sprites).create()
    model = this
    comps = "2D, Canvas, SpriteAnimation, #{model.get('comp')}, Movement, Keyboard, Gravity, Collision"
    entity = Crafty.e(comps)
    entity
      .attr
        x: Crafty.viewport.width / 2 - entity.w / 2
        y: Crafty.viewport.height
        z: 300
      .reel("walking", 100, 0, 0, 4)
      .reel("jumping", 100, [[0, 0], [4, 0]])
      .reel("stand", 100, [[5, 0]])
      .movement(model.get('speed'), model.get('jump'))
      .setName(model.get('name'))
      .gravityConst(@get('gravityConst'))
      .gravity("MapTile")
      .bind 'NewDirection', (dir) ->
        console.log dir
        if dir.x == 0 and not this._up
          this.pauseAnimation()
          this.animate('stand')
        else if dir.x > 0
          this.unflip()
          this.animate('walking', -1)
        else if dir.x < 0
          this.flip('X')
          this.animate('walking', -1)
        if this._up
          this.animate('jumping', 0)
      .onHit 'MapTile', (comps) ->
        this.x -= this._movement.x
        this.y -= -this._jumpSpeed if this._up
        this._up = false

    entity.origin(entity.w / 2, entity.h / 2)
    Crafty.viewport.follow(entity, 0, 0)

    model.set
      entity: entity

module.exports = PlayerEntity
