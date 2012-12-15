PROJECT = "sprockets-handlebars_template"

namespace :test do
  desc "Run all specs on multiple ruby versions (requires rvm)"
  task :portability do
    require "yaml"
    travis_options = YAML::load_file(File.expand_path("../.travis.yml", __FILE__))
    travis_options["rvm"].each do |version|
      system <<-BASH
bash -c 'source ~/.rvm/scripts/rvm;
rvm #{version};
ruby_version_string_size=`ruby -v | wc -m`
echo;
for ((c=1; c<$ruby_version_string_size; c++)); do echo -n "="; done
echo;
echo "`ruby -v`";
for ((c=1; c<$ruby_version_string_size; c++)); do echo -n "="; done
echo;
bundle install;
bundle exec rspec spec 2>&1;'
      BASH
    end
  end
end

desc "rewrite gemspec with add_dependency from Gemfile"
task :gemspec do
  require "bundler"
  gemspec = "#{PROJECT}.gemspec"

  deps = Bundler.definition.dependencies.find_all{|v|
    v.groups.include? :default
  }

  deps = deps.map {|dep|
    list = [dep.name] + dep.requirements_list
    "\ts.add_dependency #{list.map(&:inspect).join(', ')}\n"
  }

  lines = File.read(gemspec).lines.to_a
  idx = lines.find_index{|v| v =~ /s\.add_dependency/} || -2
  lines.delete_if{|v| v =~ /s\.add_dependency/}
  lines.insert(idx, *deps)

  File.write(gemspec, lines.join(""))
end
