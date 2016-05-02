defmodule TimeAgoWords do
  use Timex

  @moduledoc """
  Return the difference between two times using words.
  """

  # def diff(from_time, to_time \\ DateTime.now) do
  #   case from_time > to_time do
  #     true ->
  #       from = to_time
  #       to = from_time
  #     false ->
  #       from = from_time
  #       to = to_time
  #   end
  #   distance_in_seconds = abs(DateTime.to_seconds(to_time) - DateTime.to_seconds(from_time))
  #   distance_in_minutes = abs(round(distance_in_seconds / 60.0))

  #   words = case distance_in_minutes do
  #     n when n in 0..1 ->
  #       "Less than 1 minute"
  #     n when n in 2..45 ->
  #       "#{n} minutes"
  #     n when n in 45..90 ->
  #       "about 1 hour"
  #     n when n in 90..1440 ->
  #       "about #{round(n / 60.0)} hours"
  #     n when n in 1440..2520 ->
  #       "about 1 day"
  #     n when n in 2520..43200 ->
  #       "about #{round(n / 1440.0)} days"
  #     n when n in 43200..525600 ->
  #       "about #{round(n / 43200.0)} months"
  #     _ -> "a long time"
  #   end
  #   words
  # end

  def diff(from_time, to_time \\ Time.now)

  def diff({_,_,_} = from_time, {_,_,_} = to_time) do
    case from_time > to_time do
      true ->
        from = to_time
        to = from_time
      false ->
        from = from_time
        to = to_time
    end
    distance_in_seconds = abs(Time.to_seconds(to_time) - Time.to_seconds(from_time))
    distance_in_minutes = abs(round(distance_in_seconds / 60.0))

    words = case distance_in_minutes do
      n when n in 0..1 ->
        "Less than 1 minute"
      n when n in 2..45 ->
        "#{n} minutes"
      n when n in 45..90 ->
        "about 1 hour"
      n when n in 90..1440 ->
        "about #{round(n / 60.0)} hours"
      n when n in 1440..2520 ->
        "about 1 day"
      n when n in 2520..43200 ->
        "about #{round(n / 1440.0)} days"
      n when n in 43200..525600 ->
        "about #{round(n / 43200.0)} months"
      _ -> "a long time"
    end
    words
  end

  def diff(%DateTime{} = from_time, %DateTime{} = to_time) do
    diff(DateTime.to_timestamp(from_time), DateTime.to_timestamp(to_time))
  end

  def diff(%DateTime{} = from_time, to_time) do
    diff(DateTime.to_timestamp(from_time), to_time)
  end
end
