(function() {
  define(["jquery", "underscore", "backbone", "base/.tmp/scripts/models/todo"], function($, _, Backbone, Todo) {
    return describe('todo', function() {
      it('validates a bad todo', function() {
        var todo;
        todo = new Todo({
          title: null
        });
        return expect(todo.isValid()).to.equal(false);
      });
      return it('validates a blank todo', function() {
        var todo;
        todo = new Todo({
          title: '  '
        });
        return expect(todo.isValid()).to.equal(false);
      });
    });
  });

}).call(this);
