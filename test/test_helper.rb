require "simplecov"
SimpleCov.start

require "bundler/setup"
require "time_window"

require "minitest/utils"
require "minitest/autorun"

ENV["TZ"] = "UTC/Etc"
