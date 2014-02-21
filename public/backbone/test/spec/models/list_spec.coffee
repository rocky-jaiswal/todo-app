define ["jquery", "underscore", 
"backbone", "base/.tmp/scripts/models/list"], 
($, _, Backbone, List) ->

  describe 'list', ->
    it 'validates a bad list', ->
      list = new List({name: null})
      expect(list.isValid()).to.equal(false)

    it 'validates a blank todo', ->
      list = new List({name: '  '})
      expect(list.isValid()).to.equal(false)
