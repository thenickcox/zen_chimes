#!/usr/bin/env ruby
CHIME_DIR = File.realpath File.dirname(__FILE__) + '/../audio'
puts "Audio Path: #{CHIME_DIR}"
require 'time'

def play_chime(style='single')
  system "afplay #{CHIME_DIR}/chime_#{style}.mp3 >/dev/null &"
end

start = Time.now
play_chime('single')

puts "=[Zen Chimes]=================================================="
puts "= Running: '#{ARGV.join(' ')}'"
puts "= "
puts "= Take this time to breathe and focus."
puts "==============================================================="
puts ""

system *Array( ARGV )

puts ""
puts "==============================================================="
puts ""

elapsed_time = Time.now - start
# Wait at least 10 seconds between start/end chimes
sleep (5-elapsed_time) if elapsed_time < 5

if elapsed_time < 60
  play_chime('single')
else
  play_chime('triple')
end
