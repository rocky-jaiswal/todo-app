(function() {
  define(["jquery", "underscore", "backbone", "base/.tmp/scripts/collections/lists"], function($, _, Backbone, Lists) {
    return describe('collection of lists', function() {
      return it('has a list of todos', function() {
        var list, lists;
        lists = new Lists([
          {
            id: 1,
            name: 'list1'
          }, {
            id: 2,
            name: 'list2'
          }
        ]);
        list = lists.at(0);
        return expect(list.todos.url).to.equal('api/v1/lists/1/todos');
      });
    });
  });

}).call(this);
