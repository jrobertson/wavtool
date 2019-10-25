# Introducing the wavtool gem

## Usage

    require 'wavtool'

    WavTool.new(out: '/tmp/silence.wav', sample_rate: 22050).silence duration: 1
    WavTool.new(src_path: '/tmp/talk', out: '/tmp/out.wav', verbose: true, debug: true).concat %w(the_time_is.wav 1.wav 30.wav pm.wav)

## Resources

* wavtool https://rubygems.org/gems/wavtool

wavetool gem wave audio sound concat wav
