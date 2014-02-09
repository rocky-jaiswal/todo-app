define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  'use strict'
  
  class Todo extends Backbone.Model

    initialize: ->
      