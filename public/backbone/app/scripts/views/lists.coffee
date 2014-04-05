define ["jquery", "underscore", "backbone", "hbs!../templates/lists",
"./todos", "../models/list"],
($, _, Backbone, listsTemplate, TodosView, List) ->

  'use strict'

  class ListsView extends Backbone.View

    el: "#lists"

    events:
      "submit #list-form"  :  "addList"
      "click .delete"      :  "deleteList"

    initialize: ->
      @render()

    render: =>
      lists = @collection.toJSON()
      lists = _.map lists, (obj) =>
        if String(obj.id) is @options.options?.listId
          _.extend(obj, {class: "selected"}) 
        else
          _.extend(obj, {class: "not-selected"}) 
      @$el.html(listsTemplate({lists: lists}))
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
      @collection.get(id).destroy()
      @options.options.app.navigate("home", {trigger: true})