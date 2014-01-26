class Sprites extends Backbone.Model
  defaults:
    images:
      ghost:
        file: 'images/sprites/ghost.png'
        tile: 50
        tileh: 110
        elements:
          ghost: [0, 0]
      walker:
        file: 'images/sprites/walker.png'
        tile: 50
        tileh: 110
        elements:
          walker: [0, 0]
      robot:
        file: 'images/sprites/mech.png'
        tile: 50
        tileh: 110
        elements:
          robot: [0, 0]
      vine:
        file: 'images/sprites/vines_grow.png'
        tile: 110
        tileh: 110
        elements:
          vine: [0, 0]
      mech_door:
        file: 'images/sprites/mech_door.png'
        tile: 110
        tileh: 110
        elements:
          mech_door: [0, 0]
      ghost_door:
        file: 'images/sprites/ghost_door.png'
        tile: 110
        tileh: 110
        elements:
          ghost_door: [0, 0]
      walker_door:
        file: 'images/sprites/walker_door.png'
        tile: 110
        tileh: 110
        elements:
          walker_door: [0, 0]
      minions:
        file: 'images/sprites/minion.png'
        tile: 102
        tileh: 84
        elements:
          minion: [0,0]

  create: (key) ->
    if key?
      element = this.get('images')[key]
      if element.tileh?
        Crafty.sprite(element.tile, element.tileh, element.file, element.elements)
      else
        Crafty.sprite(element.tile, element.file, element.elements)

      return true

    _.each(this.get('images'), (element, k) ->
      if element.tileh?
        Crafty.sprite(element.tile, element.tileh, element.file, element.elements)
      else
        Crafty.sprite(element.tile, element.file, element.elements)
    )
  
  getPaths: ->
    (element.file for element in this.get('images'))


module.exports = Sprites
