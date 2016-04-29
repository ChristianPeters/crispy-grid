Gem::Specification.new do |s|
  # Release Specific Information
  s.version = "0.6.0"
  s.date = "2013-11-04"

  # Gem Details
  s.name = "crispy-grid"
  s.authors = ["Christian Peters", "Lucas Nolte"]
  s.summary = %q{A grid that strives for lean & sane CSS and supports complex layouts}
  s.description = %q{In short, Crispy Grid closes the gap between easy-to-use grids for simple web pages and doing everything by hand due to layout complexity.}
  s.email = "crispy.dev@gmail.com"
  s.homepage = "https://github.com/ChristianPeters/crispy-grid"
  s.license = 'MIT'

  # Gem Files
  s.files = %w(README.md MIT-LICENSE)
  s.files += Dir.glob("lib/**/*.*")
  s.files += Dir.glob("vendor/**/*.*")
  s.files += Dir.glob("templates/**/*.*")

  # Gem Dependencies
  s.rubygems_version = %q{1.3.6}
  s.add_dependency 'sass', '>= 3.1.2'
end

