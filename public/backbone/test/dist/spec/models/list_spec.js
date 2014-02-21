(function() {
  define(["jquery", "underscore", "backbone", "base/.tmp/scripts/models/list"], function($, _, Backbone, List) {
    return describe('list', function() {
      it('validates a bad list', function() {
        var list;
        list = new List({
          name: null
        });
        return expect(list.isValid()).to.equal(false);
      });
      return it('validates a blank todo', function() {
        var list;
        list = new List({
          name: '  '
        });
        return expect(list.isValid()).to.equal(false);
      });
    });
  });

}).call(this);
