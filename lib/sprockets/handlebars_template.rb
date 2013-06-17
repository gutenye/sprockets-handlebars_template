require "sprockets"
require "sprockets/handlebars_template/loader"

module Sprockets
  class HandlebarsTemplate < Tilt::Template
    self.default_mime_type = "application/javascript"

    @@options = {
      :target =>"Handlebars.TEMPLATES",
      :wrapper_proc => proc { |source| %!Handlebars.compile(#{source.to_json});! },
      :key_name_proc => proc { |name| name.sub(%r~^templates/~, "") },
      :precompile => true,
      :precompile_proc => proc { |source| Barber::FilePrecompiler.call(source) }
    }

    def self.options=(options)
      @@options.merge!(options)
    end

    def self.options
      @@options
    end

    def self.engine_initialized?
      String.respond_to?(:to_json) && const_defined?(:Barber)
    end

    def initialize_engine
      require_template_library "json"
      require_template_library "barber"
    end

    def prepare
    end

    def evaluate(scope, locals, &block)
      @options = self.class.options.merge(options)
      name = options[:key_name_proc].call(scope.logical_path)
      wrap_proc = options[ options[:precompile] ? :precompile_proc : :wrapper_proc]
      source = wrap_proc.call(data)

      "#{options[:target]}['#{name}']=#{source}"
    end
  end

  register_engine ".handlebars", HandlebarsTemplate
  register_engine ".hbs", HandlebarsTemplate
end
