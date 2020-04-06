# Sandbox used to generate the sample output for the exam

require "./poll"

# EXAMPLE 1: Greatest QB Poll with Voting
# set up poll
poll = Poll.new("./sample_polls/greatest_quarterbacks.txt")
poll.title = "Greatest NFL Quaterbacks of All Time"

# generate poll options and display
poll.generate_options
puts poll.output

# vote for an option
poll.record_vote("Tom Brady")
puts "\nAfter a vote is cast for Tom Brady...\n\n"

# generate poll results and display
poll.generate_results
puts poll.output
puts

# display other information about the poll
puts "Winner: #{poll.winner} (#{poll.winner_count} votes)"

puts Array.new(25, "=").join + "\n\n"

# EXAMPLE 2: Output From Testing Case
# set up poll
poll2 = Poll.new("./sample_polls/greatest_coaches.txt")
poll2.title = "Greatest NFL Coaches in Super Bowl Era"

# generate poll options and display
poll2.generate_options
puts poll2.output
puts

# generate poll results and display
poll2.generate_results
puts poll2.output
