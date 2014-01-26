#It grabs the base entity file and assigns it to the variable base entity
BaseEntity = require 'entities/base'
Sprites = require 'sprites'
require 'components/movement'

class NPE extends BaseEntity
  defaults:
    speed: 8
    #jump: 15
    comp: 'npe'
    name: 'nonplayer_entity'
    gravityConst: 1

  active: true

  initialize: (x, y, opts...) ->
    (new Sprites).create()
    model = this
    comps = "2D, Canvas, SpriteAnimation, #{model.get('comp')}, Gravity, Collision"
    entity = Crafty.e(comps)
    entity
      .attr
        x: x
        y: y
        z: 300
      #.movement(model.get('speed'), model.get('jump'))
      .setName(model.get('name'))
      .gravityConst(@get('gravityConst'))
      .gravity("MapTile")
      .bind 'NewDirection', (dir) ->
        return unless model.active
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
        #this.x -= this._movement.x
        this.y -= -this._jumpSpeed if this._up
        this._up = false

    entity.origin(entity.w / 2, entity.h / 2)

    model.set
      entity: entity

  deactivate: ->
    @get('entity').attr('z', 299)
    @get('entity').alpha = 0.5
    @get('entity').disableControl()
    @active = false

  activate: ->
    @get('entity').attr('z', 300)
    @get('entity').alpha = 1
    @get('entity')._up = false
    @get('entity').enableControl()
    Crafty.viewport.follow(@get('entity'), 0, 0)
    @active = true

module.exports = NPE
