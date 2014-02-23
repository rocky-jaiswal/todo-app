define ["jquery", "underscore", "backbone", "hbs!../templates/login"], 
($, _, Backbone, loginTemplate) ->
  'use strict'
  
  class LoginView extends Backbone.View

    el: "#main"

    events:
      "submit #login-form"  :  "login"

    initialize: ->
      @render()

    render: ->
      @$el.html(loginTemplate)

    login: (e) ->
      e.preventDefault()
      $form = $(e.currentTarget)
      creds = _.pluck($form.serializeArray(), 'value')
      $.post("/api/v1/login", {user: {email: creds[0], password: creds[1]}}, @handleSuccess)

    handleSuccess: (data) =>
      if data.success
        localStorage.setItem("email", data.email)
        localStorage.setItem("token", data.token)
        @options.app.navigate("home", {trigger: true})

