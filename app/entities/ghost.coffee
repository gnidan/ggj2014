#It grabs the base entity file and assigns it to the variable base entity
PlayerEntity = require 'entities/player_entity'

class Ghost extends PlayerEntity
  defaults:
    speed: 5
    jump: 10
    comp: 'ghost'
    name: 'Ghost'
  initialize: -> 
    super
    this.get("entity")
      .bind "KeyUp", (e) -> 
        if e.key == Crafty.keys["SPACE"]
          #new Minion(this.x, this.y)
module.exports = Ghost
