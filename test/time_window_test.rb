require "test_helper"

class TimeWindowTest < Minitest::Test
  test "returns current time" do
    now = Time.at(0)

    Time.stub :now, now do
      assert_equal TimeWindow.now, now
    end
  end

  test "overrides now proc" do
    old_proc = TimeWindow.now_proc
    now = Time.at(0)
    TimeWindow.now_proc = -> { now }

    assert_equal now, TimeWindow.now

    TimeWindow.now_proc = old_proc
  end

  test "raises with invalid unit" do
    assert_raises(TimeWindow::InvalidUnit) do
      TimeWindow.call("1d")
    end
  end

  test "raises with invalid window" do
    assert_raises(TimeWindow::InvalidWindow) do
      TimeWindow.call("0h")
    end

    assert_raises(TimeWindow::InvalidWindow) do
      TimeWindow.call("0m")
    end
  end
end
