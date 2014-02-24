define ["jquery", "underscore", "backbone", "hbs!../templates/_navbar"],
($, _, Backbone, navbarTemplate) ->
  'use strict'
  
  class NavbarView extends Backbone.View

    initialize: ->
      @render()

    render: ->
      @$el.html(navbarTemplate)
