define ["jquery", "underscore", "backbone", "hbs!../templates/_footer"], 
($, _, Backbone, footerTemplate) ->
  'use strict'
  
  class FooterView extends Backbone.View

    initialize: ->
      @render()

    render: ->
      @$el.html(footerTemplate)
