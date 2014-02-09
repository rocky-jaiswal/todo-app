(function() {
  define(["jquery", "underscore", "backbone"], function($, _, Backbone) {
    return describe('simple check', function() {
      return it('checks backbone', function() {
        var size;
        size = _.size([1, 2, 3, 4]);
        return expect(size).to.equal(4);
      });
    });
  });

}).call(this);
