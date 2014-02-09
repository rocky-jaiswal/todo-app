define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->

  describe 'simple check', ->
    it 'checks backbone', ->
      size = _.size([1, 2, 3, 4])
      expect(size).to.equal(4)
