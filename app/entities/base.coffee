Sprites = require 'sprites'

class BaseEntity extends Backbone.Model
  defaults:
    entity: null

  initialize: ->
    (new Sprites).create()

  getEntity: ->
    this.get('entity')

  remove: ->
    entity = this.getEntity()

    entity.destroy() if entity

module.exports = BaseEntity
