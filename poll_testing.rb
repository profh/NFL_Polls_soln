require './poll'
require './helpers/poll_test_helpers'
require 'minitest/autorun'

class TestPoll < Minitest::Test
  include PollTestHelpers
  
  def setup
    @poll1 = Poll.new("./sample_polls/greatest_coaches.txt")
    @poll1.title = "Greatest NFL Coaches in Super Bowl Era"
    @poll2 = Poll.new("./sample_polls/greatest_running_backs.txt")
    @poll2.title = "Greatest NFL Running Backs Ever"
  end
  
  def teardown
    @poll1 = nil
  end

  def test_accessor_methods_work
    assert @poll1.respond_to?(:options)
    assert !@poll1.respond_to?(:options=)
    assert @poll1.respond_to?(:results)
    assert !@poll1.respond_to?(:results=)
    assert @poll1.respond_to?(:file)
    assert @poll1.respond_to?(:file=)
    assert @poll1.respond_to?(:num_votes)
    assert @poll1.respond_to?(:num_votes=)
    assert @poll1.respond_to?(:title)
    assert @poll1.respond_to?(:title=)
    assert @poll1.respond_to?(:output)
    assert @poll1.respond_to?(:output=)
  end
  
  def test_init_works
    assert @poll1.output.empty?
    assert_equal 0, @poll1.num_votes
    refute_nil @poll1.file
    refute @poll1.options.empty?
    refute @poll1.results.empty?
  end
  
  def test_file_setter_resets_options_and_results
    assert_equal 5, @poll1.options.count
    # change to shorter poll
    @poll1.file = "./sample_polls/greatest_tight_ends.txt"
    assert_equal 3, @poll1.options.count
    assert_equal 3, @poll1.results.count
    # go back to longer poll
    @poll1.file = "./sample_polls/greatest_coaches.txt"
    assert_equal 5, @poll1.options.count
    assert_equal 5, @poll1.results.count
  end

  def test_winner
    assert_equal "Bill Belichick", @poll1.winner
    # did you really think there'd be any other winner among coaches? ;-)
    assert_equal "Barry Sanders", @poll2.winner
    # if there is a tie, simply return the last option with the high score
  end
  
  def test_winner_count
    assert_equal 830, @poll1.winner_count
    assert_equal 267, @poll2.winner_count
  end
  
  def test_record_vote
    # assert precondition
    choice = @poll1.options.first
    assert_equal "Bill Belichick", choice
    belichick_count = @poll1.results.first[1]
    assert_equal 830, belichick_count
    # execute the method
    @poll1.record_vote(choice)
    # assert postcondition
    @poll1_reload = Poll.new("./sample_polls/greatest_coaches.txt")
    assert_equal (belichick_count + 1), @poll1_reload.results.first[1]
    # reset file back to original status (for testing purposes)
    reset_file(@poll1, choice)
  end
  
  def test_total_votes
    assert_equal 1486, @poll1.total_votes
    assert_equal 1014, @poll2.total_votes   
  end
  
  def test_generate_options
    assert @poll1.output.empty?
    # fill output with options content
    @poll1.generate_options
    assert_equal expected_options_output_coaches, @poll1.output
    # doing it again to be sure...
    assert @poll2.output.empty?
    @poll2.generate_options
    assert_equal expected_options_output_running_backs, @poll2.output
  end
  
  def test_generate_results
    assert @poll1.output.empty?
    # fill output with results content
    @poll1.generate_results
    assert_equal expected_results_output_coaches, @poll1.output
    # doing it again to be sure...
    assert @poll2.output.empty?
    # fill output with results content
    @poll2.generate_results
    assert_equal expected_results_output_running_backs, @poll2.output
  end

  def test_output_buffer_reset
    assert @poll1.output.empty?
    # fill output with content
    @poll1.generate_options
    assert_equal expected_options_output_coaches, @poll1.output
    # fill output with different content than previous
    @poll1.generate_results
    assert_equal expected_results_output_coaches, @poll1.output
    # again, fill output w/ different content than prior
    @poll1.generate_options
    assert_equal expected_options_output_coaches, @poll1.output
  end

end
