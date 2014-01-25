class Sprites extends Backbone.Model
  defaults:
    images:
      ghost:
        file: '/images/fpo-walk.png'
        tile: 50
        tileh: 110
        elements:
          ghost: [0, 0]

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
