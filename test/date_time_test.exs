require IEx
defmodule DateTimeTest do
  use ShouldI, async: true
  use Timex
  doctest TimeAgoWords

  test "returns time in words for now" do
    words = TimeAgoWords.diff(DateTime.now)
    assert words == "Less than 1 minute"
  end

  test "returns time in words for 30 minutes" do
    time = DateTime.shift(DateTime.now, minutes: 30)
    words = TimeAgoWords.diff(time)
    assert words =~ ~r/30 minutes/
  end

  test "returns time in words for 46 minutes" do
    time = DateTime.shift(DateTime.now, minutes: 46)
    words = TimeAgoWords.diff(time)
    assert words =~ ~r/about 1 hour/
  end

  test "returns time in words for 89 minutes" do
    time = DateTime.shift(DateTime.now, minutes: 89)
    words = TimeAgoWords.diff(time)
    assert words =~ ~r/about 1 hour/
  end

  test "returns time in words for 91 minutes" do
    time = DateTime.shift(DateTime.now, minutes: 91)
    words = TimeAgoWords.diff(time)
    assert words =~ ~r/about 2 hours/
  end

  test "returns time in words for 200 minutes" do
    time = DateTime.shift(DateTime.now, minutes: 200)
    words = TimeAgoWords.diff(time)
    assert words =~ ~r/about 3 hours/
  end

  test "returns time in words for 1000 minutes" do
    time = DateTime.shift(DateTime.now, minutes: 1000)
    words = TimeAgoWords.diff(time)
    assert words =~ ~r/about 17 hours/
  end

  test "returns time in words for 1450 minutes" do
    time = DateTime.shift(DateTime.now, minutes: 1450)
    words = TimeAgoWords.diff(time)
    assert words =~ ~r/about 1 day/
  end

  test "returns time in words for 2200 minutes" do
    time = DateTime.shift(DateTime.now, minutes: 2200)
    words = TimeAgoWords.diff(time)
    assert words =~ ~r/about 1 day/
  end

  test "returns time in words for 2600 minutes" do
    time = DateTime.shift(DateTime.now, minutes: 2600)
    words = TimeAgoWords.diff(time)
    assert words =~ ~r/about 2 days/
  end

  test "returns time in words for 43000 minutes" do
    time = DateTime.shift(DateTime.now, minutes: 43000)
    words = TimeAgoWords.diff(time)
    assert words =~ ~r/about 30 days/
  end

  test "returns time in words for 44000 minutes" do
    time = DateTime.shift(DateTime.now, minutes: 44000)
    words = TimeAgoWords.diff(time)
    assert words =~ ~r/about 1 months/
  end

  test "returns time in words for 87000 minutes" do
    time = DateTime.shift(DateTime.now, minutes: 87000)
    words = TimeAgoWords.diff(time)
    assert words =~ ~r/about 2 months/
  end

  test "returns time in words for 525600 minutes" do
    time = DateTime.shift(DateTime.now, minutes: 525600)
    words = TimeAgoWords.diff(time)
    assert words =~ ~r/about 12 months/
  end

  test "returns time in words for 525601 minutes" do
    time = DateTime.shift(DateTime.now, minutes: 525601)
    words = TimeAgoWords.diff(time)
    assert words =~ ~r/a long time/
  end

  test "with 2 arguments" do
    to_time = DateTime.now
    from_time = DateTime.shift(DateTime.now, minutes: 525601)
    words = TimeAgoWords.diff(from_time, to_time)
    assert words =~ ~r/a long time/
  end
end
