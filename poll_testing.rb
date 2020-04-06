require './poll'
require './helpers/poll_test_helpers'
require 'minitest/autorun'

class TestPoll < Minitest::Test
  include PollTestHelpers
  
  def setup
    @poll = Poll.new("./sample_polls/greatest_coaches.txt")
    @poll.title = "Greatest NFL Coaches in Super Bowl Era"
  end
  
  def teardown
    @poll = nil
  end

  def test_accessor_methods_work
    assert @poll.respond_to?(:options)
    assert !@poll.respond_to?(:options=)
    assert @poll.respond_to?(:results)
    assert !@poll.respond_to?(:results=)
    assert @poll.respond_to?(:file)
    assert @poll.respond_to?(:file=)
    assert @poll.respond_to?(:num_votes)
    assert @poll.respond_to?(:num_votes=)
    assert @poll.respond_to?(:title)
    assert @poll.respond_to?(:title=)
  end
  
  def test_init_works
    assert @poll.output.empty?
    assert_equal 0, @poll.num_votes
    refute_nil @poll.file
    refute @poll.options.empty?
    refute @poll.results.empty?
  end
  
  def test_file_setter_resets_options_and_results
    assert_equal 5, @poll.options.count
    # change to shorter poll
    @poll.file = "./sample_polls/greatest_tight_ends.txt"
    assert_equal 3, @poll.options.count
    assert_equal 3, @poll.results.count
    # go back to longer poll
    @poll.file = "./sample_polls/greatest_coaches.txt"
    assert_equal 5, @poll.options.count
    assert_equal 5, @poll.results.count
  end

  def test_winner
    assert_equal "Bill Belichick", @poll.winner
    # did you really think there'd be any other winner? ;-)
  end
  
  def test_winner_count
    assert_equal 830, @poll.winner_count
  end
  
  def test_record_vote
    # assert precondition
    choice = @poll.options.first
    assert_equal "Bill Belichick", choice
    belichick_count = @poll.results.first[1]
    assert_equal 830, belichick_count
    # execute the method
    @poll.record_vote(choice)
    # assert postcondition
    @poll_reload = Poll.new("./sample_polls/greatest_coaches.txt")
    assert_equal (belichick_count + 1), @poll_reload.results.first[1]
    # reset file back to original status (for testing purposes)
    reset_file(@poll, choice)
  end
  
  def test_total_votes
    assert_equal 1486, @poll.total_votes   
  end
  
  def test_generate_options
    assert @poll.output.empty?
    # fill output with options content
    @poll.generate_options
    assert_equal expected_options_output, @poll.output
  end
  
  def test_generate_results
    assert @poll.output.empty?
    # fill output with results content
    @poll.generate_results
    assert_equal expected_results_output, @poll.output
  end

  def test_output_buffer_reset
    assert @poll.output.empty?
    # fill output with content
    @poll.generate_options
    assert_equal expected_options_output, @poll.output
    # fill output with different content than previous
    @poll.generate_results
    assert_equal expected_results_output, @poll.output
    # again, fill output w/ different content than prior
    @poll.generate_options
    assert_equal expected_options_output, @poll.output
  end

end
