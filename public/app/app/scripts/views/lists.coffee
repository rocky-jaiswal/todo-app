define ["jquery", "underscore", "backbone", 
"handlebars", "hbs!../templates/lists"], 
($, _, Backbone, Handlebars, listsTemplate) ->
  
  'use strict'
  
  class ListsView extends Backbone.View

    initialize: ->
      @render()

    render: ->
      @$el.html(listsTemplate({lists: @collection.toJSON()}))
