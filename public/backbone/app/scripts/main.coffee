#/*global require*/
'use strict'

require.config
  shim:
    underscore:
      exports: '_'
    
    backbone:
      deps: [
        'underscore'
        'jquery'
      ]
      exports: 'Backbone'
    
    bootstrap:
      deps: ['jquery'],
      exports: 'bootstrap'

    handlebars:
      exports: "Handlebars"
  
  paths:
    jquery: '../bower_components/jquery/jquery'
    backbone: '../bower_components/backbone/backbone'
    underscore: '../bower_components/underscore/underscore'
    bootstrap: '../bower_components/sass-bootstrap/dist/js/bootstrap'
    handlebars: '../bower_components/handlebars/handlebars'
    hbs: '../bower_components/require-handlebars-plugin/hbs'

require ['backbone', 'router/app_router'], (Backbone, AppRouter) ->
  new AppRouter()
  Backbone.history.start()
  
