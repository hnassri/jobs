require 'json'

$:.unshift File.expand_path("./../lib", __FILE__)
require 'router'
Router.new.perform