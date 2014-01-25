BaseEntity = require 'entities/base'
Sprites = require 'sprites'
require 'scenes/main'

sprites = new Sprites
sprites.create()

class Game
  start: ->
    Crafty.init(800, 600)
    Crafty.canvas.init()
    Crafty.background('green')

    Crafty.scene('main')




$(document).ready ->
  console.log "here we go!"
  g = new Game
  g.start()


