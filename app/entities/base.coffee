class BaseEntity extends Backbone.Model
  defaults:
    entity: null

  initialize: ->

  getEntity: ->
    this.get('entity')

  remove: ->
    entity = this.getEntity()

    entity.destroy() if entity

module.exports = BaseEntity
