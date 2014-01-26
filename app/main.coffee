BaseEntity = require 'entities/base'
require 'scenes/main'


class Game
  start: ->
    Crafty.init(600, 600)
    Crafty.canvas.init()
    Crafty.background('green')

    Crafty.scene('main')




$(document).ready ->
  console.log "here we go!"
  g = new Game
  g.start()


