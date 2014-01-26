#It grabs the base entity file and assigns it to the variable base entity
PlayerEntity = require 'entities/player_entity'
Vine = require 'entities/vine'

class LifeWalker extends PlayerEntity
  defaults:
    comp: 'walker'
    name: 'Walker'
    speed: 8
    jump: 20
    gravityConst: 1
    frames:
      walking: [[0, 0], [1, 0], [2, 0]]
      jumping: [[0, 0], [4, 0]]
      stand: [[5, 0]]

  layer: 'Life'

  initialize: ->
    super

    if @get('facing') is 'left'
      x = @get('entity').attr('x') - 40
    else
      x = @get('entity').attr('x') + 40

    _this = this
    @get('entity').bind 'KeyDown', (e) ->
      return unless _this.active
      if e.key == Crafty.keys.SPACE
        new Vine(x, @_y)

module.exports = LifeWalker
