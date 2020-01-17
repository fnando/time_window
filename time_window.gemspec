# frozen_string_literal: true

require "./lib/time_window/version"

Gem::Specification.new do |spec|
  spec.name          = "time_window"
  spec.version       = TimeWindow::VERSION
  spec.authors       = ["Nando Vieira"]
  spec.email         = ["me@fnando.com"]

  spec.summary       = %w[
    Retrieve time objects by time windows (e.g.
    TimeWindow.call("5m") will round minutes to multiples of
    5).
  ].join(" ")
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/fnando/time_window"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`
      .split("\x0")
      .reject {|f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) {|f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-utils"
  spec.add_development_dependency "pry-meta"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-fnando"
  spec.add_development_dependency "simplecov"
end
