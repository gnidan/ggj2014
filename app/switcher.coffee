class Switcher
  activeIndex: 0

  layers: ['Ghost', 'Life', 'Robot']

  backgrounds:
    'Ghost': '#21325b'
    'Life': '#94cbf2'
    'Robot': '#cccccc'

  bindTabKey: ->
    activateNext = _.bind(@activateNext, this)
    @entity = Crafty.e('2D, Canvas, Keyboard')
      .bind 'KeyDown', (e) =>
        if e.key == Crafty.keys['TAB']
          e.originalEvent.preventDefault()

          activateNext()

  constructor: (@characters=[], @entitiesByLayer) ->
    @bindTabKey()

    @enableLayer @characters[@activeIndex].layer


  activateNext: ->
    cur = @activeIndex
    next = (@activeIndex + 1) % @characters.length
  
    @characters[cur].deactivate()
    @characters[next].activate()

    @enableLayer @characters[next].layer

    @activeIndex = next

  enableLayer: (layer) ->
    disable = (layer) =>
      es = @entitiesByLayer("#{layer}Foreground")
      if es?
        for e in es
          e.visible = false

    enable = (layer) =>
      es = @entitiesByLayer("#{layer}Foreground")
      if es?
        for e in es
          e.visible = true

    for other in @layers when other isnt layer
      disable other
    enable layer
    Crafty.background(@backgrounds[layer])

module.exports = Switcher
