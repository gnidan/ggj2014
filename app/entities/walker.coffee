#It grabs the base entity file and assigns it to the variable base entity
PlayerEntity = require 'entities/player_entity'

class LifeWalker extends PlayerEntity
  defaults:
    comp: 'walker'
    name: 'Walker'
    speed: 8
    jump: 20
    gravityConst: 1

  layer: 'Life'

module.exports = LifeWalker
