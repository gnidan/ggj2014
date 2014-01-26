#It grabs the base entity file and assigns it to the variable base entity
PlayerEntity = require 'entities/player_entity'

class Robot extends PlayerEntity
  defaults:
    speed: 2
    jump: 0
    comp: 'robot'
    name: 'Robot'

module.exports = Robot
