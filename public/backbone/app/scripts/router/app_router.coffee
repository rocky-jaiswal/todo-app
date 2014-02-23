define ["jquery", "underscore", "backbone", "../init", "../views/login"], ($, _, Backbone, Init, LoginView) ->
  'use strict'
  
  class AppRouter extends Backbone.Router

    routes:
      ""				        : "login"
      "home"            : "root"
      "lists/:list_id"	: "showList"

    login: ->
      new LoginView({app: @})

    root: ->
      Init.init({app: @})

    showList: (id) ->
      Init.init({listId: id, app: @})

      