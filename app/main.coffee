BaseEntity = require 'entities/base'

images:
  ghost:
    file: '/images/ghost.png'
    tile: 50
    tileh: 110
    elements:
      ghost: [0, 0]


class Ghost extends BaseEntity
  initialize: ->
    console.log 'so far so good'

g = new Ghost
