#It grabs the base entity file and assigns it to the variable base entity
PlayerEntity = require 'entities/player_entity'

class Ghost extends PlayerEntity
  defaults:
    speed: 5
    jump: 10
    comp: 'ghost'
    name: 'Ghost'
    gravityConst: 0.3
    frames:
      walking: [[0, 0], [1, 0], [2, 0]]
      jumping: [[0, 0], [4, 0]]
      stand: [[0, 0]]

  layer: 'Ghost'

  initialize: ->
    super
    this.get("entity")
      .bind "KeyUp", (e) ->

module.exports = Ghost
