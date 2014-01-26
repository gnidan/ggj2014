Crafty.c 'Movement',
  _speed: 3
  _up: false

  init: ->
    @requires 'Fourway', 'Keyboard'

  movement: (speed, jump) ->
    @multiway speed,
      RIGHT_ARROW: 0
      LEFT_ARROW: 180
      D: 0
      A: 180
      Q: 180

    @_speed = speed if speed

    if arguments.length < 2
      @_jumpSpeed = @_speed * 2
    else
      @_jumpSpeed = jump

    @bind 'EnterFrame', ->
      return if @disableControls
      if @_up
        @y -= @_jumpSpeed
        @_falling = true
    .bind 'KeyDown', (e) ->
      if e.key == Crafty.keys.UP_ARROW or
          e.key == Crafty.keys.W or
          e.key == Crafty.keys.Z
        @_up = true

        @trigger 'NewDirection', {x: 0, y: -@_jumpSpeed}

    this
