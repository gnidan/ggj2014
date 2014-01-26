#It grabs the base entity file and assigns it to the variable base entity
NPE = require 'entities/npe'

class Minion extends NPE
  defaults:
    speed: 5
    #jump: 10
    comp: 'minion'
    name: 'Minion'
    gravityConst: 0

  #layer: 'Ghost'

  #initialize: ->
    #super
    #entity = @get('entity')    
    #this.get("entity")
    #  .bind "KeyUp", (e) ->
    #   if e.key == Crafty.keys.SPACE
    #     console.log "SSSPAAAAAAAAAAAAAAAAAAAAAAAACE!!!"
    #new GhostMinion(entity.x,entity.y
  initialize: (x, y, facing) ->
    model = this
    @set('facing', facing)
    comps = "2D, Canvas, SpriteAnimation, minion, Gravity, Collision"
    entity = Crafty.e(comps)
    entity
      .attr
        x: x
        y: y
        z: 299
      .reel('travel', 300, 0, 0, 2)
      .bind 'AnimationEnd', ->
        @addComponent 'MapTile'
      .animate('travel', -1)
      .bind "EnterFrame", ->
        if model.get('facing') == 'right'
          @flip('X')
          @x += 1
        else
          @unflip()
          @x -= 1
          
    @set 'entity', entity
    
    @interval = setInterval((=>
      facing = @get('facing')
      if facing == 'left'
        facing = 'right'
      else
        facing = 'left'
      @set('facing', facing)
    ), 10000)
  
  remove: ->
    super
    if @interval?
     clearInterval(@interval)


module.exports = Minion
