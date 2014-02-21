define ["jquery", "underscore", "backbone", 
"handlebars", "hbs!../templates/_footer"], 
($, _, Backbone, Handlebars, footerTemplate) ->
  'use strict'
  
  class FooterView extends Backbone.View

    initialize: ->
      @render()

    render: ->
      @$el.html(footerTemplate)
