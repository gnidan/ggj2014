BaseEntity = require 'entities/base'
require 'scenes/main'


class Game
  start: ->
    Crafty.init(null, 500)
    Crafty.canvas.init()
    Crafty.background('#94cbf2')

    Crafty.scene('main')




$(document).ready ->
  console.log "here we go!"
  g = new Game
  g.start()


