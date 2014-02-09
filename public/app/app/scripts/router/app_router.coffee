define ["jquery", "underscore", "backbone", "../init"], ($, _, Backbone, Init) ->
  'use strict'
  
  class AppRouter extends Backbone.Router

    routes:
      "": "root"

    root: ->
      Init.init()

      