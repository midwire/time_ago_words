# TimeAgoWords

Return the difference between two times using words.

This is a limited port of the Rails ActionView DateHelper method `distance_of_time_in_words`. I did not need to worry about times greater than 12 months so I punted and made those times return "a long time". Feel free to drop a Pull Request if you want to add that.

This is my first attempt at a Hex package. Please let me know if you have suggestions to do something better.

## Installation

The package can be installed as follows:

  1. Add time_ago_words to your list of dependencies in `mix.exs`:

        def deps do
          [{:time_ago_words, "~> 0.0.2"}]
        end

  2. Ensure time_ago_words is started before your application:

        def application do
          [applications: [:time_ago_words]]
        end

## Usage

    post = Repo.get!(Post, id)
    TimeAgoWords.diff(post.inserted_at)
    # => "about 3 days"
