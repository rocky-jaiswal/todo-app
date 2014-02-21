define ["jquery", "underscore", 
"backbone", "base/.tmp/scripts/models/todo"], 
($, _, Backbone, Todo) ->

  describe 'todo', ->
    it 'validates a bad todo', ->
      todo = new Todo({title: null})
      expect(todo.isValid()).to.equal(false)

    it 'validates a blank todo', ->
      todo = new Todo({title: '  '})
      expect(todo.isValid()).to.equal(false)
