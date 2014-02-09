var tests = [];
for (var file in window.__karma__.files) {
  if (window.__karma__.files.hasOwnProperty(file)) {
    if (/spec\.js$/.test(file)) {
      tests.push(file);
    }
  }
}

requirejs.config({
    paths: {
        jquery: '/base/app/bower_components/jquery/jquery',
        underscore: '/base/app/bower_components/underscore/underscore',
        backbone: '/base/app/bower_components/backbone/backbone',
        bootstrap: '/base/app/bower_components/sass-bootstrap/dist/js/bootstrap',
        handlebars: '/base/app/bower_components/handlebars/handlebars',
        hbs: '/base/app/bower_components/require-handlebars-plugin/hbs'
    },

    shim: {
        'underscore': {
            exports: '_'
        },
        backbone: {
            deps: ['underscore', 'jquery'],
            exports: 'Backbone'
        }
    },

    // ask Require.js to load these files (all our tests)
    deps: tests,

    // start test run, once Require.js is done
    callback: window.__karma__.start
});