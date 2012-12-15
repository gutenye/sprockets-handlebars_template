Gem::Specification.new do |s|
	s.name = "sprockets-handlebars_template"
	s.version = File.read("VERSION")
  s.summary = "a handlebars template for sprockets."
	s.description = <<-EOF
a handlebars template for sprockets.
	EOF

	s.author = "Guten"
	s.email = "ywzhaifei@gmail.com"
	s.homepage = "http://github.com/GutenYe/sprockets-handlebars_template"

  s.files = Dir["CHANGELOG.md", "README.md", "lib/**/*"]

	s.add_dependency "sprockets", ">= 0"
	s.add_dependency "barber", ">= 0"
end
