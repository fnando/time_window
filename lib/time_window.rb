module TimeWindow
  require "time_window/version"

  InvalidUnit = Class.new(StandardError)
  InvalidWindow = Class.new(StandardError)

  ALIASES = {
    "s" => "second",
    "m" => "minute",
    "h" => "hour"
  }.freeze

  class << self
    attr_accessor :now_proc
  end

  self.now_proc = -> { Time.now }

  def self.now
    now_proc.call
  end

  # Retrieve the formatted date time window.
  # The `time` param defaults to the current time.
  # Returns a `Time` object.
  #
  # Accept units are: s (second), m (minute), h (hour).
  #
  #   TimeWindow.call("5m")
  #   #=> 2018-12-10 05:40:00 -0800
  #
  def self.call(window, time = now)
    _, window, unit = *window.match(/\A(\d+)(.)\z/)

    window = Integer(window)
    unit = ALIASES.fetch(unit) { raise InvalidUnit, "#{unit.inspect} is not a valid unit" }

    hour, minute, second = public_send("process_#{unit}_window", time, window)

    Time.new(time.year, time.month, time.day, hour, minute, second)
  end

  def self.process_second_window(time, window)
    raise InvalidWindow, "#{window.inspect} must be covered by 1..59" unless (1..59).cover?(window)

    second = time.sec - (time.sec % window)

    [time.hour, time.min, second]
  end

  def self.process_minute_window(time, window)
    raise InvalidWindow, "#{window.inspect} must be covered by 1..59" unless (1..59).cover?(window)

    minute = time.min - (time.min % window)

    [time.hour, minute, 0]
  end

  def self.process_hour_window(time, window)
    raise InvalidWindow, "#{window.inspect} must be covered by 1..23" unless (1..23).cover?(window)

    hour = time.hour - (time.hour % window)

    [hour, 0, 0]
  end
end
