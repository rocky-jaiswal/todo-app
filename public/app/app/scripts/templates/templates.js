define(['handlebars'], function(Handlebars) {

this["JST"] = this["JST"] || {};

Handlebars.registerPartial("footer", Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class=\"container\">\n  <div class=\"footer\">\n    <hr/>\n    <p>♥ Rocky J</p>\n  </div>\n</div>";
  }));

Handlebars.registerPartial("navbar", Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class=\"navbar navbar-default navbar-fixed-top\" role=\"navigation\">\n  <div class=\"container\">\n    <div class=\"navbar-header\">\n      <a class=\"navbar-brand\" href=\"#\">To Do App</a>\n    </div>\n    <div class=\"navbar-collapse collapse\">\n      <ul class=\"nav navbar-nav\">\n        <li class=\"active\"><a href=\"#\">Home</a></li>\n      </ul>\n      <ul class=\"nav navbar-nav navbar-right\">\n        <li class=\"active\"><a href=\"#\">Logout</a></li>\n      </ul>\n    </div>\n  </div>\n</div>";
  }));

this["JST"]["app/scripts/templates/lists.hbs"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<h2>Lists</h2>";
  });

this["JST"]["app/scripts/templates/main.hbs"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class=\"container\">\n  <div class=\"row\">\n    <div class=\"col-md-12\">\n      <div class=\"row\">\n        <div class=\"col-md-3\">\n          <div id=\"#lists\"></div>\n        </div>\n        <div class=\"col-md-9\">\n          <h2>To Do</h2>\n          <p>\n            <a class=\"btn btn-lg btn-primary\" href=\"#\" role=\"button\">Add Item</a>\n          </p>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>";
  });

return this["JST"];

});