(function(module) {
	"use strict";

	var theme = {},
		meta = module.parent.require('./meta'),
		path = module.parent.require('path'),
        nconf = module.parent.require('nconf');
        
    theme.defineWidgetAreas = function(areas, callback) {
        areas = areas.concat([
            {
                name: "Heading",
                template: "categories.tpl",
                location: "heading"
            },
            {
                name: "MOTD",
                template: "categories.tpl",
                location: "motd"
            },
            {
                name: "Categories Sidebar",
                template: "categories.tpl",
                location: "sidebar"
            },
            {
                name: "Category Sidebar",
                template: "category.tpl",
                location: "sidebar"
            },
            {
                name: "Topic Sidebar",
                template: "topic.tpl",
                location: "sidebar"
            },
            {
                name: "Topic Footer",
                template: "topic.tpl",
                location: "footer"
            }
        ]);

        callback(null, areas);
    };
    

	module.exports = theme;

}(module));