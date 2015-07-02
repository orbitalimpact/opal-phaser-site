require 'examples/lib/basics/click_on_an_image'
require 'examples/lib/basics/image_follow_input'
require 'examples/lib/basics/load_an_animation'
require 'examples/lib/basics/load_an_image'
require 'examples/lib/basics/move_an_image'
require 'examples/lib/basics/render_text'
require 'examples/lib/basics/tween_an_image'
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
      elsif params._example == "load_an_animation"
        $example = LoadAnAnimation::Game.new
      elsif params._example == "load_an_image"
        $example = LoadAnImage::Game.new
      elsif params._example == "move_an_image"
        $example = MoveAnImage::Game.new
      elsif params._example == "render_text"
        $example = RenderText::Game.new
      elsif params._example == "tween_an_image"
        $example = TweenAnImage::Game.new
      end
    end
  end
end
