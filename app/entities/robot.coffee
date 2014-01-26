#It grabs the base entity file and assigns it to the variable base entity
PlayerEntity = require 'entities/player_entity'

class Robot extends PlayerEntity
  defaults:
    exit: 'Door.Robot'
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
  
  initialize: ->
    super
    this.get("entity")
      .bind "KeyUp", (e) ->
        if e.key == Crafty.keys.SPACE
          console.log "SSSPAAAAAAAAAAAAAAAAAAAAAAAACE!!!"
          #collision = entity.hit('Switch')
          #if collision
            #//collision is either false or an array of colliding objects
            #switch = collision[0]
            #switch.animate
            #ePlatfrom = new ElevatorPlatform(switch._x+4,switch._y)
          #collision = entity.hit('Gate')
          #if collision
            #gate = collision[0]
            #gate.animate
            #gate.open()
            
module.exports = Robot
