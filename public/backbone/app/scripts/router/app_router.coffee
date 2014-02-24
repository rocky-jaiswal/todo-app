define ["jquery", "underscore", "backbone", "../init", "../views/login"], ($, _, Backbone, Init, LoginView) ->
  'use strict'
  
  class AppRouter extends Backbone.Router

    routes:
      ""				        : "login"
      "home"            : "root"
      "lists/:list_id"  : "showList"
      "logout"	        : "logout"

    login: ->
      new LoginView({app: @})

    root: ->
      Init.init({app: @})

    showList: (id) ->
      Init.init({listId: id, app: @})

    logout: ->
      email = localStorage.getItem("email")
      token = localStorage.getItem("token")
      $.ajax({url: "/api/v1/logout", type: "delete", headers: {email: email, token: token}})
      @cleanUp()

    cleanUp: ->
      localStorage.removeItem("email")
      localStorage.removeItem("token")
      @navigate("/", {trigger: true})
      location.reload()

      