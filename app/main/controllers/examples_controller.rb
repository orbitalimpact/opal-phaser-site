require 'examples/lib/click_on_an_image'
require 'examples/lib/image_follow_input'
require 'pp'

module Main
  class ExamplesController < Volt::ModelController
    model :page
    
    def index
      puts "index"
    end

    def template
      puts "template"
    end

    def before_template_remove
      $example.phaser_game.destroy
    end

    def template_ready
      puts "template ready"
      pp ClickOnAnImage
      
      if params._example == "click_on_an_image"
        $example = ClickOnAnImage.new
      elsif params._example == "image_follow_input"
        $example = ImageFollowInput.new
      end
    end
  end
end
