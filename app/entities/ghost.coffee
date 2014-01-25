#It grabs the base entity file and assigns it to the variable base entity
PlayerEntity = require 'entities/player_entity'

class Ghost extends PlayerEntity
  defaults:
    speed: 5
    jump: 10
    comp: 'ghost'
    name: 'Ghost'

module.exports = Ghost
