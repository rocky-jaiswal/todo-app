define ["jquery", "underscore", "backbone", "hbs!../templates/login"], 
($, _, Backbone, loginTemplate) ->
  'use strict'
  
  class LoginView extends Backbone.View

    el: "#main"

    initialize: ->
      @render()

    render: ->
      @$el.html(loginTemplate)
