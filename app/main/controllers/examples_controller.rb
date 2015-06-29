require 'examples/lib/click_on_an_image'
module Main
  class ExamplesController < Volt::ModelController
    model :page
    
    def index
      puts "index"
    end

    def template
      puts "template"
    end

    def template_ready
      puts "template ready"
      Game.new
    end

  end
end
