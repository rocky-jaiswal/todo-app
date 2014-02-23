define ["jquery", "underscore", 
"backbone", "handlebars", 
"hbs!../templates/main", "../collections/lists", "./lists"], 
($, _, Backbone, Handlebars, mainTemplate, Lists, ListsView) ->
  
  'use strict'
  
  class MainView extends Backbone.View

    initialize: ->
      @lists = new Lists
      @lists.fetch({reset: true})
      @lists.on("reset", @render)

    render: =>
      @$el.html(mainTemplate)
      @listsView = new ListsView({collection: @lists, options: @options.options})
