define ["jquery", "underscore", "backbone", 
"handlebars", "jquery_form",
"hbs!../templates/todos"], 
($, _, Backbone, Handlebars, jqueryForm, todosTemplate) ->
  
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
      $form.ajaxSubmit(success: @handleResponse, error: @handleError)

    handleResponse: (response, status, xhr, form) =>
      @collection.fetch()

    handleError: (response) =>
      console.log response.responseText
