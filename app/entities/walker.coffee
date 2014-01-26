#It grabs the base entity file and assigns it to the variable base entity
PlayerEntity = require 'entities/player_entity'
Vine = require 'entities/vine'

TOP_BLOCK = 'tile124'

class LifeWalker extends PlayerEntity
  defaults:
    exit: 'Door.Walker'
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
        comps = _this.get('boundingEntity').hit('Foreground')
        if comps
          coords = []

          for e in comps
            e = e.obj
            if e.attr('tile') == TOP_BLOCK
              coords.push
                x: e._x
                y: e._y
            e.destroy()

            new Vine(x, y) for {x, y} in coords

module.exports = LifeWalker
