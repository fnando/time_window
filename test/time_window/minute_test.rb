# frozen_string_literal: true

require "test_helper"

class MinuteTest < Minitest::Test
  test "returns time window for 1m" do
    {
      "2018-12-10T00:00:14+00:00" => "2018-12-10T00:00:00+00:00",
      "2018-12-10T00:01:38+00:00" => "2018-12-10T00:01:00+00:00",
      "2018-12-10T00:59:35+00:00" => "2018-12-10T00:59:00+00:00"
    }.each do |input, output|
      time_window = TimeWindow.call("1m", Time.parse(input))
      assert_equal output, time_window.iso8601
    end
  end

  test "returns time window for 2m" do
    {
      "2018-12-10T00:00:14+00:00" => "2018-12-10T00:00:00+00:00",
      "2018-12-10T00:01:38+00:00" => "2018-12-10T00:00:00+00:00",
      "2018-12-10T00:02:47+00:00" => "2018-12-10T00:02:00+00:00",
      "2018-12-10T00:12:44+00:00" => "2018-12-10T00:12:00+00:00",
      "2018-12-10T00:13:25+00:00" => "2018-12-10T00:12:00+00:00",
      "2018-12-10T00:59:35+00:00" => "2018-12-10T00:58:00+00:00"
    }.each do |input, output|
      time_window = TimeWindow.call("2m", Time.parse(input))
      assert_equal output, time_window.iso8601
    end
  end

  test "returns time window for 5m" do
    {
      "2018-12-10T00:00:14+00:00" => "2018-12-10T00:00:00+00:00",
      "2018-12-10T00:01:38+00:00" => "2018-12-10T00:00:00+00:00",
      "2018-12-10T00:06:24+00:00" => "2018-12-10T00:05:00+00:00",
      "2018-12-10T00:11:59+00:00" => "2018-12-10T00:10:00+00:00",
      "2018-12-10T00:15:01+00:00" => "2018-12-10T00:15:00+00:00",
      "2018-12-10T00:59:35+00:00" => "2018-12-10T00:55:00+00:00"
    }.each do |input, output|
      time_window = TimeWindow.call("5m", Time.parse(input))
      assert_equal output, time_window.iso8601
    end
  end

  test "returns time window for 10m" do
    {
      "2018-12-10T00:00:14+00:00" => "2018-12-10T00:00:00+00:00",
      "2018-12-10T00:09:38+00:00" => "2018-12-10T00:00:00+00:00",
      "2018-12-10T00:10:12+00:00" => "2018-12-10T00:10:00+00:00",
      "2018-12-10T00:14:31+00:00" => "2018-12-10T00:10:00+00:00",
      "2018-12-10T00:19:55+00:00" => "2018-12-10T00:10:00+00:00",
      "2018-12-10T00:27:01+00:00" => "2018-12-10T00:20:00+00:00",
      "2018-12-10T00:59:40+00:00" => "2018-12-10T00:50:00+00:00"
    }.each do |input, output|
      time_window = TimeWindow.call("10m", Time.parse(input))
      assert_equal output, time_window.iso8601
    end
  end

  test "returns time window for 15m" do
    {
      "2018-12-10T00:00:14+00:00" => "2018-12-10T00:00:00+00:00",
      "2018-12-10T00:01:38+00:00" => "2018-12-10T00:00:00+00:00",
      "2018-12-10T00:16:19+00:00" => "2018-12-10T00:15:00+00:00",
      "2018-12-10T00:29:07+00:00" => "2018-12-10T00:15:00+00:00",
      "2018-12-10T00:30:58+00:00" => "2018-12-10T00:30:00+00:00",
      "2018-12-10T00:44:44+00:00" => "2018-12-10T00:30:00+00:00",
      "2018-12-10T00:46:25+00:00" => "2018-12-10T00:45:00+00:00",
      "2018-12-10T00:59:11+00:00" => "2018-12-10T00:45:00+00:00"
    }.each do |input, output|
      time_window = TimeWindow.call("15m", Time.parse(input))
      assert_equal output, time_window.iso8601
    end
  end
end
