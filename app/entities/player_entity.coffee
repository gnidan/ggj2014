#It grabs the base entity file and assigns it to the variable base entity
BaseEntity = require 'entities/base'
Sprites = require 'sprites'
require 'components/movement'

class PlayerEntity extends BaseEntity
  defaults:
    doorActivated: false
    facing: 'right'
    speed: 8
    jump: 15
    comp: 'player'
    name: 'player_entity'
    gravityConst: 1
    frames:
      walking: [[0, 0], [1, 0], [2, 0]]
      jumping: [[4, 0]]
      stand: [[0, 0]]

  active: true

  initialize: (x, y, opts...) ->
    super(opts...)

    model = this
    comps = "2D, Canvas, SpriteAnimation, #{model.get('comp')}, Movement, Keyboard, Gravity, Collision"
    entity = Crafty.e(comps)

    entity
      .attr
        x: x
        y: y
        z: 300
      .reel("walking", 300, @get('frames').walking)
      .reel("jumping", 300, @get('frames').jumping)
      .reel("stand", 300, @get('frames').stand)
      .movement(model.get('speed'), model.get('jump'))
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
          model.set('facing', 'right')
          this.animate('walking', -1)
        else if dir.x < 0
          this.flip('X')
          model.set('facing', 'left')
          this.animate('walking', -1)
        if this._up
          this.animate('jumping', 0)
      .onHit 'MapTile', (comps) ->
        this.x -= this._movement.x
        this.y -= -this._jumpSpeed if this._up
        this._up = false
      .onHit model.get('exit'), (comps) ->
        unless model.get('doorActivated')
          console.log 'got home'
          model.set('doorActivated', true)
          comps[0].obj.animate('activate')
      .onHit 'Foreground', (comps) ->
        unless model.active
          this._falling = false
          return

        if this._falling and
            not this._up and
            this._movement.x == 0 and
            this._movement.y == 0
          this._falling = false
        else
          this.x -= this._movement.x
          this.y -= -this._jumpSpeed if this._up
          this._up = false
          this._falling = false
      .bind 'hit', -> # collision with ground (Gravity)
        this.pauseAnimation()
        this.animate('stand')

    updateBoundingEntityPos = ->
      padding = 20
      paddingTop = 75
      boundingEntity.attr
        x: entity._x - padding
        w: entity._w + 2 * padding
        y: entity._y - paddingTop
        h: entity._h + (padding + paddingTop)
        z: 100
      
    boundingEntity = Crafty.e('2D, Canvas, Collision, DebugRectangle')
      .debugStroke('green')
    updateBoundingEntityPos()

    entity.bind 'Move', ->
      updateBoundingEntityPos()

    model.set
      entity: entity
      boundingEntity: boundingEntity

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

module.exports = PlayerEntity
