define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  'use strict'
  
  class Todo extends Backbone.Model

    initialize: ->

    validate: (attrs, options) ->
      return {msg: "✗ Todo: title cannot be blank"} unless(attrs.title?.trim().length > 0)
      