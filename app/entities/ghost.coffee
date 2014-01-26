#It grabs the base entity file and assigns it to the variable base entity
PlayerEntity = require 'entities/player_entity'
Minion = require 'entities/minion'

class Ghost extends PlayerEntity
  defaults:
    exit: 'Door.Ghost'
    comp: 'ghost'
    name: 'Ghost'
    speed: 5
    jump: 10

    gravityConst: 0.3
    frames:
      walking: [[0, 0], [1, 0], [2, 0]]
      jumping: [[4, 0]]
      stand: [[0, 0]]

  layer: 'Ghost'

  initialize: ->
    super
    #this.get("entity")
    #  .bind "KeyUp", (e) ->
    #    if e.key == Crafty.keys.SPACE
    #      console.log "SSSPAAAAAAAAAAAAAAAAAAAAAAAACE!!!"
    #      new Minion.origin(@.x,@.y)
    _this = this
    @get('entity').bind 'KeyDown', (e) ->
      return unless _this.active
      if e.key == Crafty.keys.SPACE
        new Minion(@_x+25, @_y, _this.get('facing'))
module.exports = Ghost
