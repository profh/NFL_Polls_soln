require './helpers/poll_helpers'

class Poll
  include PollHelpers
  
  def initialize(poll_file)
    @output = []
    @title = ""
    @num_votes = 0
    @file = poll_file
    read_file
  end
  
  # Creating getters and setters
  attr_reader :options, :results, :file
  attr_accessor :num_votes, :title, :output
  
  def file=(file)
    @file = file
    read_file
  end
  
  # Public methods
  def winner
    results.sort_by{ |k,v| v }.last[0]
  end
  
  def winner_count
    results.values.max
    # results.sort_by{ |k,v| v }.reverse.first[1]
  end
  
  def record_vote(choice)
    results[choice] += 1
    overwrite_file!(results)
  end
  
  def total_votes
    # @num_votes = results.values.sum
    @num_votes = results.values.inject(0) {|sum, num| sum + num}
    # sol = 0
    # results.each{|o,v| sol = sol + v}
    # return sol
  end
  
  def generate_options
    reset_output_buffer
    print_header(:options)
    options.sort.each { |option| output << "#{option}"  }
  end
  
  def generate_results
    reset_output_buffer
    total_votes
    print_header(:results)
    results.sort_by{ |k,v| v }.reverse.each do |option,count| 
      output << "#{option}: #{count*100/num_votes}%  (#{count})" 
    end
  end
end