define ["jquery", "underscore", "backbone", 
"handlebars", "hbs!../templates/todos", "../models/todo"], 
($, _, Backbone, Handlebars, todosTemplate, Todo) ->
  
  'use strict'
  
  class TodosView extends Backbone.View

    el: "#todos"

    events:
      "submit #todo-form"  :  "addTodo"

    initialize: ->
      @collection.on("sync", @render)
      @render()

    render: =>
      @$el.html(todosTemplate({todos: @collection.toJSON(), list_id: @options.list_id}))

    addTodo: (e) ->
      e.preventDefault()
      $form = $(e.currentTarget)
      @createTodo($form)

    createTodo: ($form) ->
      @todo = new Todo({}, {collection: @collection})
      @todo.on("invalid", @handleError)
      @todo.on("sync", @updateAll)
      @todo.save({title: $form.serializeArray()[0].value})

    updateAll: =>
      @undelegateEvents()
      @collection.fetch()

    handleError: (model, error) =>
      @showError(error.msg)

    showError: (msg) ->
      $(".error-messages").html(msg)
