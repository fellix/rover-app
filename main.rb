require 'rubygems'
require 'bundler/setup'

Dir.glob("lib/**/**.rb").each { |f| require_relative f }

app = RoverApp.new
app.start
