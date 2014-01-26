BaseEntity = require 'entities/base'  

class Complete extends BaseEntity
  initialize: (x, y)->
    entity = Crafty.e('2D, Canvas, SpriteAnimation, complete')
    entity.attr
      x: x - 100
      y: y
      z: 500

module.exports = Complete