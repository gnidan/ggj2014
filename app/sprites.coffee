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
