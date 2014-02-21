define ["jquery", "underscore", "backbone", "../init"], ($, _, Backbone, Init) ->
  'use strict'
  
  class AppRouter extends Backbone.Router

    routes:
      ""              : "root"
      "lists/:list_id": "showList"

    root: ->
      Init.init({app: @})

    showList: (id) ->
      Init.init({listId: id, app: @})

      