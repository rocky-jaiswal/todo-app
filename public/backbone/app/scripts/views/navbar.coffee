define ["jquery", "underscore", "backbone", "handlebars", "hbs!../templates/_navbar"], ($, _, Backbone, Handlebars, navbarTemplate) ->
  'use strict'
  
  class NavbarView extends Backbone.View

    initialize: ->
      @render()

    render: ->
      @$el.html(navbarTemplate)
