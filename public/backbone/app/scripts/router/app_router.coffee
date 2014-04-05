define ["jquery", "underscore", "backbone", "../init", "../views/login", "../views/navbar", "../views/footer"],
($, _, Backbone, Init, LoginView, NavbarView, FooterView) ->
  'use strict'
  
  class AppRouter extends Backbone.Router

    routes:
      ""				        : "login"
      "home"            : "home"
      "lists/:list_id"  : "showList"
      "logout"	        : "logout"

    login: ->
      new LoginView({app: @})

    home: ->
      @views = Init.init({app: @})

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
      _.each @views, (view) -> view.$el.hide() if (view instanceof(NavbarView)) or (view instanceof(FooterView))
      @navigate("/", {trigger: true})