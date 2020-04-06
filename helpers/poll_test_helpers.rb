require 'minitest/reporters'
require './helpers/minitest_extensions'

module PollTestHelpers
  
  # Reset file after a vote has been made
  def reset_file(poll, option)
    poll_file = File.open(poll.file, "r+")
    poll.results.each do |response, number| 
      response == option ? number -= 1 : number
      poll_file.puts "#{response}\t#{number}" 
    end
    poll_file.close
  end

  # Return the expected options output 
  # (run sandbox.rb or see the pdf version if unsure)
  def expected_options_output 
    options_output = [
      "Greatest NFL Coaches in Super Bowl Era",
      "-----------------------------------------",
      "Please choose from the following options:\n\n",
      "Bill Belichick",
      "Chuck Noll",
      "Joe Gibbs",
      "Tom Landry",
      "Vince Lombardi"
    ]
    return options_output
  end
  
   # Return the expected results output
   # (run sandbox.rb or see the pdf version if unsure)
  def expected_results_output 
    results_output = [
      "Greatest NFL Coaches in Super Bowl Era",
      "-----------------------------------------",
      "Current results (1486 votes):\n\n",
      "Bill Belichick: 55%  (830)",
      "Joe Gibbs: 15%  (232)",
      "Vince Lombardi: 14%  (209)",      
      "Chuck Noll: 10%  (161)",
      "Tom Landry: 3%  (54)"
    ]
    return results_output
  end
  
  # Spruce up minitest results...
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]
  
end