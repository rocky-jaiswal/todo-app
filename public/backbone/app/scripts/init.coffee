define ["jquery", "backbone", "require",
"views/footer", "views/navbar", "views/main"],
($, Backbone, require, FooterView, NavbarView, MainView) ->
  
  'use strict'

  class Init
    
    @init: (options) ->
      #HomeView  = require("app/views/home")
      mapping =
        "#navbar" : NavbarView
        "#main"   : MainView
        "#footer" : FooterView

      initialized = {}
      views = []

      for selector, view of mapping
        if $("body").has(selector).length isnt 0
          views.push(new view({el: selector, options})) unless initialized[selector]
          initialized[selector] = true

      views