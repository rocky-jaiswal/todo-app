define ["jquery", "underscore", "backbone", 
"handlebars", "hbs!../templates/lists",
"./todos"], 
($, _, Backbone, Handlebars, listsTemplate, TodosView) ->
  
  'use strict'
  
  class ListsView extends Backbone.View

    el: "#lists"

    initialize: ->
      @render()

    render: ->
      @$el.html(listsTemplate({lists: @collection.toJSON()}))
      @fetch(@options.options.listId) if @options.options?.listId

    fetch: (id) ->
      @list = @collection.get(id)
      @list.todos.on("sync", @showTodos)
      @list.todos.fetch()

    showTodos: =>
      todosView = new TodosView({collection: @list.todos, list_id: @list.get('id')})
