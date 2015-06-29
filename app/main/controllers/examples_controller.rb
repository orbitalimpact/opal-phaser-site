module Main
  require 'opal-phaser'
  puts "test"
  class ExamplesController < Volt::ModelController
    model :page
    
    def index
    end
    
    def template
      page._example = params._example
    end
  end
end