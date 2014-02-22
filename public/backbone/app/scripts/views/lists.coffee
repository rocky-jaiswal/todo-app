define ["jquery", "underscore", "backbone", 
"handlebars", "hbs!../templates/lists",
"./todos", "../models/list"], 
($, _, Backbone, Handlebars, listsTemplate, TodosView, List) ->
  
  'use strict'
  
  class ListsView extends Backbone.View

    el: "#lists"

    events:
      "submit #list-form"  :  "addList"
      "click .delete"      :  "deleteList"

    initialize: ->
      @render()

    render: =>
      @$el.html(listsTemplate({lists: @collection.toJSON()}))
      @getTodosForList(@options.options.listId) if @options.options?.listId

    getTodosForList: (id) ->
      @selectedList = @collection.get(id)
      @selectedList.todos.on("sync", @showTodos)
      @selectedList.todos.fetch()

    showTodos: =>
      todosView = new TodosView({collection: @selectedList.todos, list_id: @selectedList.get('id')})

    #methods for adding a new list

    addList: (e) ->
      e.preventDefault()
      $form = $(e.currentTarget)
      @createList($form)

    createList: ($form) ->
      @list = new List({}, {collection: @collection})
      @list.on("invalid", @handleError)
      @list.on("sync", @showList)
      @list.save({name: $form.serializeArray()[0].value}, {success: @handleSuccess, error: @handleError})

    handleSuccess: =>
      @list.fetch()

    showList: =>
      @undelegateEvents()
      @options.options.app.navigate("/lists/#{@list.id}", {trigger: true})

    handleError: (model, error) =>
      @showError(error.msg)

    showError: (msg) ->
      $(".error-messages").html(msg)

    deleteList: (e) ->
      e.preventDefault()
      id = $(e.currentTarget).data("id")
      l = @collection.get(id)
      l.destroy()
      #@updateAll()