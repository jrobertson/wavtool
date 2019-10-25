#!/usr/bin/env ruby

# file: wavtool.rb

# description: Join WAV files together with ease.

require 'c32'
require 'wavefile'

class WavTool
  include WaveFile
  using ColouredText

  def initialize(out: 'out.wav', channels: :mono, format_code: :pcm_16, 
      sample_rate: 44100, src_path: '.', verbose: false, debug: false)
    
    @format = Format.new(channels, format_code, sample_rate)
    @src_path, @out = src_path, out
    @verbose, @debug = verbose, debug
    
    if @verbose then
      puts 'WavTool'.highlight 
      puts 'options: generate_silence, concat'.info
      puts
    end
  end
    
  # creates a WAV file containing only silence for a fixed duration
  #
  def generate_silence(filename=@out, duration: 1)

    square_cycle = [0] * 100 * duration
    buffer = Buffer.new(square_cycle, 
        Format.new(@format.channels, :float, @format.sample_rate))

    Writer.new(filename, @format) do |writer|
      (@format.sample_rate.to_i / 100).times { writer.write(buffer) }
    end

  end

  alias silence generate_silence
  
  # concatenates WAV files into a single WAV file
  #
  def concat(files, save_file=@out)
    
    puts ('Running concat ...').info; puts if @verbose
    puts ('files: ' + files.inspect).debug if @debug
    
    verbose, debug = @verbose, @debug
    
    Writer.new(save_file, @format) do |writer|

      files.each do |file_name|

        filepath = File.join(@src_path, file_name)
        puts ('concatenating: ' + filepath.inspect).debug if debug
        Reader.new(filepath).each_buffer(samples_per_buffer=4096) do |buffer|
          writer.write(buffer)
        end

      end
    end
    
    puts ('WAV file ' + @out + ' created').info if @verbose
  end

  def duration(file_name)
    Reader.new(file_name).total_duration    
  end

end
