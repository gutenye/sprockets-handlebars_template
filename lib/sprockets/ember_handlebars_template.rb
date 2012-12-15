require "sprockets/handlebars_template"

Sprockets::HandlebarsTemplate.options = {
  :target =>"Ember.TEMPLATES",
  :wrapper_proc => proc { |source| "Ember.Handlebars.compile(#{source});" },
  :precompile_proc => proc { |source| Barber::Ember::FilePrecompiler.call(source) }
}
