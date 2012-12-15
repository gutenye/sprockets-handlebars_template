require "spec_helper"

describe "EmberHandlebarsTemplate" do
  before do
    load "#{$spec_root}/../lib/sprockets/ember_handlebars_template.rb"
    HandlebarsTemplate = Sprockets::HandlebarsTemplate unless defined?(HandlebarsTemplate)

    @template = HandlebarsTemplate.new { "foo" }
    @scope = Class.new do
      def logical_path
        "templates/posts/index"
      end
    end.new
  end

  it "compile" do
    HandlebarsTemplate.options = {
      precompile: false
    }

    b = %{Ember.TEMPLATES['posts/index']=Ember.Handlebars.compile("foo");}

    expect(@template.render(@scope)).to eq(b)
  end

  it "precompile" do
    HandlebarsTemplate.options = {
      precompile: true,
      precompile_proc: proc { |source| "#{source}1" }
    }

    b = %{Ember.TEMPLATES['posts/index']=foo1}

    expect(@template.render(@scope)).to eq(b)
  end
end
