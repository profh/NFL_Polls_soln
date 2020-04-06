module PollHelpers
  
  def read_file
    reset_options_and_results
    poll_file = File.open(file)     
    poll_file.each_line do |line|         
 	    response, number = line.chomp.split(/\t/)
 	    add_to_options(response)
      add_to_results(response, number)
    end  
  end
  
  def reset_options_and_results
    @options = Array.new
    @results = Hash.new
  end
  
  def reset_output_buffer
    @output = Array.new
  end
  
  def add_to_options(option)
    options << option
  end
  
  def add_to_results(option, count)
    results[option] = count.to_i
  end
  
  def overwrite_file!(revised)
    poll_file = File.open(file, "r+")
    revised.each { |response, number| poll_file.puts "#{response}\t#{number}" }
    poll_file.close
  end
  
  def print_header(type=nil)
    # adds the appropriate header to output
    output << "#{title}"
    output << Array.new(41, "-").join
    case type
    when :options
      output << "Please choose from the following options:\n\n"
    when :results
      output << "Current results (#{num_votes} votes):\n\n"
    else
      output << "\n\n"
    end
  end
end