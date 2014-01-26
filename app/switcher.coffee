class Switcher
  activeIndex: 0

  bindTabKey: ->
    @entity = Crafty.e('2D, Canvas, Keyboard')
      .bind 'KeyDown', (e) =>
        if e.key == Crafty.keys['TAB']
          e.originalEvent.preventDefault()

          @activateNext()

  constructor: (@characters=[]) ->
    @bindTabKey()

  activateNext: ->
    cur = @activeIndex
    next = (@activeIndex + 1) % @characters.length
    @characters[cur].deactivate()
    @characters[next].activate()
    @activeIndex = next



module.exports = Switcher
