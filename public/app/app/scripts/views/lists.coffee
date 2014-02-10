define ["jquery", "underscore", "backbone", 
"handlebars", "hbs!../templates/lists"], 
($, _, Backbone, Handlebars, listsTemplate) ->
  
  'use strict'
  
  class ListsView extends Backbone.View

    events:
      "click a.list": "viewList"

    initialize: ->
      @render()

    render: ->
      @$el.html(listsTemplate({lists: @collection.toJSON()}))

    viewList: (e) ->
      id = $(e.currentTarget).data("id")
      @list = @collection.get(id)
      @list.todos.fetch()
