BaseEntity = require 'entities/base'

class Game
  start: ->
    Crafty.init(800, 600)
    Crafty.background('green')

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
    model = this
    entity = Crafty.e( "2D, Canvas, ghost, SpriteAnimation")
    entity
      .attr
        x: Crafty.viewport.width / 2 - entity.w / 2
        y: 0
        z: 300
      .animate("walking", 0, 0, 2)
      .bind('EnterFrame', (e) ->
        this.animate("walking", 20))
      .setName('Ghost')

    entity.origin(entity.w / 2, entity.h / 2)

    model.set
        entity: entity

$(document).ready ->
  console.log "here we go!"
  g = new Game
  g.start()
