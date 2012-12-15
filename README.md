# sprockets-handlebars_template, a handlebars template for sprockets. [![Build Status](https://secure.travis-ci.org/GutenYe/sprockets-handlebars_template.png)](http://travis-ci.org/GutenYe/sprockets-handlebars_template) 

|                |                                                             |
|----------------|------------------------------------------------------       |
| Homepage:      | https://github.com/GutenYe/sprockets-handlebars_template        |
| Author:	       | Guten                                                 |
| License:       | MIT-LICENSE                                                |
| Documentation: | http://rubydoc.info/gems/sprockets-handlebars_template/frames                |
| Issue Tracker: | https://github.com/GutenYe/sprockets-handlebars_template/issues |
| Ruby Versions: | 1.9.3, Rubinius, JRuby                           |

A simple handlebars template for sprockets, you can use it with Rails, Sinatra, Middleman, Sprockets, ... It supports Handlebars and Ember.Handlebars.

Getting started
---------------

For handlebars

	require "sprockets/handlebars_template"

For ember

	require "sprockets/ember_handlebars_template"

Configuration
-------------

For handlebars

	Sprockets::HandlebarsTemplate.options = { 
		:target =>"Handlebars.TEMPLATES",
		:wrapper_proc => proc { |source| "Handlebars.compile(#{source});" },
		:key_name_proc => proc { |name| name.sub(%r~^templates/~, "") }
	}

	Sprockets::HandlebarsTemplate.precompile = true     # compile handlebars in server side.

For ember

	Sprockets::EmberHandlebarsTemplate.options = {
		:target =>"Ember.TEMPLATES",
		:wrapper_proc => proc { |source| "Ember.Handlebars.compile(#{source});" },
		:key_name_proc => proc { |name| name.sub(%r~^templates/~, "") }
	}

	Sprockets::EmberHandlebarsTemplate.precompile = true

Install
-------

	$ [sudo] gem install sprockets-handlebars_template

Development [![Dependency Status](https://gemnasium.com/GutenYe/sprockets-handlebars_template.png?branch=master)](https://gemnasium.com/GutenYe/sprockets-handlebars_template) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/GutenYe/sprockets-handlebars_template)
===========

Contributing 
-------------

* Submit any bugs/features/ideas to github issue tracker.

Please see [Contibution Documentation](https://github.com/GutenYe/sprockets-handlebars_template/blob/master/CONTRIBUTING.md).

A list of [Contributors](https://github.com/GutenYe/sprockets-handlebars_template/contributors).

Resources
---------

* [sprockets](https://github.com/sstephenson/sprockets): Rack-based asset packaging system
* [handlebars.js](https://github.com/wycats/handlebars.js): Logicless templating languages that keep the view and the code separated like we all know they should be

Copyright
---------

(the MIT License)

Copyright (c) 2012 Guten

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
