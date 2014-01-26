#It grabs the base entity file and assigns it to the variable base entity
PlayerEntity = require 'entities/player_entity'

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

module.exports = LifeWalker
