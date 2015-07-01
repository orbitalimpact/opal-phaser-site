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
    end

    def before_template_remove
      $example.phaser_game.destroy
    end

    def template_ready
      if params._example == "click_on_an_image"
        $example = ClickOnAnImage::Game.new
      elsif params._example == "image_follow_input"
        $example = ImageFollowInput::Game.new
      end
    end
  end
end
