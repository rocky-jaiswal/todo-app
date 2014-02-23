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
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n    <li>\n      <a href=\"#/lists/";
  if (stack1 = helpers.id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = (depth0 && depth0.id); stack1 = typeof stack1 === functionType ? stack1.call(depth0, {hash:{},data:data}) : stack1; }
  buffer += escapeExpression(stack1)
    + "\" class=\"list\" data-id=\"";
  if (stack1 = helpers.id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = (depth0 && depth0.id); stack1 = typeof stack1 === functionType ? stack1.call(depth0, {hash:{},data:data}) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">";
  if (stack1 = helpers.name) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = (depth0 && depth0.name); stack1 = typeof stack1 === functionType ? stack1.call(depth0, {hash:{},data:data}) : stack1; }
  buffer += escapeExpression(stack1)
    + "</a>\n      <a class=\"delete pull-right\" data-id=\"";
  if (stack1 = helpers.id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = (depth0 && depth0.id); stack1 = typeof stack1 === functionType ? stack1.call(depth0, {hash:{},data:data}) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">✖</a>\n    </li>\n  ";
  return buffer;
  }

  buffer += "<h2>Lists</h2>\n<hr/>\n\n<form action=\"/api/v1/lists/\" method=\"post\" class=\"form-inline\" id=\"list-form\" role=\"form\">\n  <div class=\"form-group\">\n    <input type=\"text\" class=\"form-control\" name=\"name\" placeholder=\"Enter list name\">\n  </div>\n  <button type=\"submit\" class=\"btn btn-success\">Add List</button>\n</form>\n\n<ul class=\"lists\">\n  ";
  stack1 = helpers.each.call(depth0, (depth0 && depth0.lists), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</ul>";
  return buffer;
  });

this["JST"]["app/scripts/templates/login.hbs"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class=\"container\">\n  <div class=\"row\">\n    <div class=\"col-md-12\">\n      <div class=\"panel panel-default\">\n        <div class=\"panel-heading\">Please login:</div>\n        <div class=\"panel-body\">\n          <form>\n            <div class=\"form-group\">\n              <label for=\"email\">Email address:</label>\n              <input type=\"email\" class=\"form-control\" name=\"email\" placeholder=\"Enter email\">\n            </div>\n            <div class=\"form-group\">\n              <label for=\"password\">Password:</label>\n              <input type=\"password\" class=\"form-control\" name=\"password\" placeholder=\"Password\">\n            </div>\n            <button type=\"submit\" class=\"btn btn-default\">Submit</button>\n          </form>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>";
  });

this["JST"]["app/scripts/templates/main.hbs"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class=\"container\">\n  <div class=\"row\">\n    <div class=\"col-md-12\">\n      <div class=\"messages\"></div>\n      <div class=\"error-messages\"></div>\n    </div>\n  </div>\n  <div class=\"row\">\n    <div class=\"col-md-12\">\n      <div class=\"row\">\n        <div class=\"col-md-3\">\n          <div id=\"lists\"></div>\n        </div>\n        <div class=\"col-md-9\">\n          <div id=\"todos\">\n          </div>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>";
  });

this["JST"]["app/scripts/templates/todos.hbs"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n    <li>";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = (depth0 && depth0.title); stack1 = typeof stack1 === functionType ? stack1.call(depth0, {hash:{},data:data}) : stack1; }
  buffer += escapeExpression(stack1)
    + "<a class=\"delete pull-right\" data-id=\"";
  if (stack1 = helpers.id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = (depth0 && depth0.id); stack1 = typeof stack1 === functionType ? stack1.call(depth0, {hash:{},data:data}) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">✖</a></li>\n  ";
  return buffer;
  }

  buffer += "<h2>To Dos</h2>\n<hr/>\n\n<form action=\"/api/v1/lists/";
  if (stack1 = helpers.list_id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = (depth0 && depth0.list_id); stack1 = typeof stack1 === functionType ? stack1.call(depth0, {hash:{},data:data}) : stack1; }
  buffer += escapeExpression(stack1)
    + "/todos\" method=\"post\" class=\"form-inline\" id=\"todo-form\" role=\"form\">\n  <div class=\"form-group\">\n    <input type=\"text\" class=\"form-control\" name=\"title\" placeholder=\"Enter todo\">\n  </div>\n  <button type=\"submit\" class=\"btn btn-primary\">Add Todo</button>\n</form>\n\n<ul class=\"todos\">\n  ";
  stack1 = helpers.each.call(depth0, (depth0 && depth0.todos), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</ul>";
  return buffer;
  });

return this["JST"];

});