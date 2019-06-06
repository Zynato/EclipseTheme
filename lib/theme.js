(function(module) {
	"use strict";

	var theme = {},
		meta = module.parent.require('./meta'),
		path = module.parent.require('path'),
        nconf = module.parent.require('nconf'),
        db = require.main.require('./src/database');

    var themeEclipseSkin = '';
        
    theme.defineWidgetAreas = function(areas, callback) {
        areas = areas.concat([
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

    theme.getThemeConfig = function(config, callback) {
        meta.settings.get('eclipse', function(err, settings) {
          config.selectedSkin = themeEclipseSkin || 'dark';
          callback(false, config);
        });
    };
    
    theme.customSettings = function (data, callback) {
        var availableSkins = [
            { name: 'Default', value: 'default' }, 
            { name: 'Dark', value: 'dark' }
        ];

        var options = '';
        var skinSelected;
        availableSkins.forEach(function (skin) {
            skinSelected = (data.settings.themeEclipseSkin === skin.value) ? 'selected' : '';
            options = options + '<option value="' + skin.value + '" ' + skinSelected + '>' + skin.name + '</option>';
        });

        data.customSettings.push({
            title: 'Select skin for theme',
            content: '<div class="form-group fg-line"><div class="select"><select data-property="themeEclipseSkin" class="form-control"><option value="">None</option>' + options + '</select></div></div>'
        });

        callback(null, data);
    };

    theme.saveSettings = function (data, callback) {
        db.setObjectField('user:' + data.uid + ':settings', 'themeEclipseSkin', data.settings.themeEclipseSkin, callback);
    };
    
    theme.getSettings = function (data, callback) {
        themeEclipseSkin = data.settings.themeEclipseSkin;
        callback(null, data);
    };
    

	module.exports = theme;

}(module));