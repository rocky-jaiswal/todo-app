define ["jquery", "underscore", "backbone", "base/.tmp/scripts/collections/lists"],
($, _, Backbone, Lists) ->

  describe 'collection of lists', ->
    it 'has a list of todos', ->
      lists = new Lists([{id: 1, name: 'list1'}, {id: 2, name: 'list2'}])
      list = lists.at(0)
      expect(list.todos.url).to.equal('api/v1/lists/1/todos')
