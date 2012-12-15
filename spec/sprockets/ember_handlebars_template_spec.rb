require "spec_helper"
require "sprockets/ember_handlebars_template"

HandlebarsTemplate = Sprockets::HandlebarsTemplate

describe HandlebarsTemplate do
  before do
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

    b = %{Ember.TEMPLATES['posts/index']="foo"1}

    expect(@template.render(@scope)).to eq(b)
  end
end
