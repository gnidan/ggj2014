class Switcher
  bindTabKey: ->
    @entity = Crafty.e('2D, Canvas, Keyboard')
      .bind 'KeyDown', (e) ->
        if e.key == Crafty.keys['TAB']
          e.originalEvent.preventDefault()
          console.log 'tab'

  constructor: (@characters={}) ->
    # characters, e.g.:
    #  
    #  'life': 
    @bindTabKey()



module.exports = Switcher
