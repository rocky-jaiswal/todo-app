define ["jquery", "underscore", "backbone", 
"handlebars", "hbs!../templates/todos", "../models/todo"], 
($, _, Backbone, Handlebars, todosTemplate, Todo) ->
  
  'use strict'
  
  class TodosView extends Backbone.View

    el: "#todos"

    events:
      "submit #todo-form"  :  "addTodo"

    initialize: ->
      @todo = new Todo({}, {collection: @collection})
      @setupEvents()
      @render()

    setupEvents: ->
      @todo.on("invalid", @handleError)
      @todo.on("sync", @updateAll)
      @collection.on("sync", @render)

    render: =>
      @$el.html(todosTemplate({todos: @collection.toJSON(), list_id: @options.list_id}))

    addTodo: (e) ->
      e.preventDefault()
      $form = $(e.currentTarget)
      @todo.save({title: $form.serializeArray()[0].value})

    updateAll: =>
      @collection.fetch()

    handleError: (model, error) =>
      @showError(error.msg)

    showError: (msg) ->
      $(".error-messages").html(msg)
