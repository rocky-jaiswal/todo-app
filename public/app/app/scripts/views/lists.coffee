define ["jquery", "underscore", "backbone", 
"handlebars", "hbs!../templates/lists"], 
($, _, Backbone, Handlebars, listsTemplate) ->
  
  'use strict'
  
  class ListsView extends Backbone.View

    #events:
      #"click a.list": "viewList"

    initialize: ->
      @render()

    render: ->
      @$el.html(listsTemplate({lists: @collection.toJSON()}))
      @fetch(@options.options.listId) if @options.options?.listId

    fetch: (id) ->
      list = @collection.get(id)
      list.todos.fetch({reset: false})
