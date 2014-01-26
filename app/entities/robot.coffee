#It grabs the base entity file and assigns it to the variable base entity
PlayerEntity = require 'entities/player_entity'

class Robot extends PlayerEntity
  defaults:
    speed: 2
    jump: 0
    comp: 'robot'
    name: 'Robot'
    gravityConst: 1.5
    frames:
      walking: [[0, 0], [1, 0], [2, 0]]
      jumping: [[0, 0]]
      stand: [[0, 0]]

  layer: 'Robot'

module.exports = Robot
