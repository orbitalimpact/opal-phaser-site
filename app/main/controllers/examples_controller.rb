require 'examples/lib/basics/click_on_an_image'
require 'examples/lib/basics/image_follow_input'
require 'examples/lib/basics/load_an_animation'
require 'examples/lib/basics/load_an_image'
require 'examples/lib/basics/move_an_image'
require 'examples/lib/basics/render_text'
require 'examples/lib/basics/tween_an_image'

require 'examples/lib/animation/animation_events'
require 'examples/lib/animation/change_frame'
require 'examples/lib/animation/change_texture_on_click'
require 'examples/lib/animation/destroy_animation'
require 'examples/lib/animation/dynamic_animation'
require 'examples/lib/animation/group_creation'
require 'examples/lib/animation/load_texture'
require 'examples/lib/animation/looped_animation'
require 'examples/lib/animation/multiple_anims'

require 'examples/lib/bitmap_data/alpha_mask'

require 'examples/lib/sprites/dynamic-crop'

require 'pp'

module Main
  class ExamplesController < Volt::ModelController
    model :page
    
    def example
    end
    
    def before_example_remove
      @params_watch.stop
    end
    
    def example_ready
      @params_watch = proc do
        if $example
          if $example.phaser_game.is_booted?
            $example.phaser_game.destroy
          end
        end
        
        ExampleSourceTask.read_source_files.then do |source_files|
          $example_source    = source_files[params._example]
          page._example_code = $example_source
        end

        if params._example
          title = params._example.split("_")
          title.each do |word|
            current_index = title.index(word)
            title[current_index] = word.capitalize
          end
          title = title.join(" ")
          
          page._title = title
        else
          page._title = "Examples"
        end
        
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
        elsif params._example == "animation_events"
          $example = AnimationEvents::Game.new
        elsif params._example == "change_frame"
          $example = ChangeFrame::Game.new
        elsif params._example == "change_texture_on_click"
          $example = ChangeTextureOnClick::Game.new
        elsif params._example == "destroy_animation"
          $example = DestroyAnimation::Game.new
        elsif params._example == "dynamic_animation"
          $example = DynamicAnimation::Game.new
        elsif params._example == "group_creation"
          $example = GroupCreation::Game.new
        elsif params._example == "load_texture"
          $example = LoadTexture::Game.new
        elsif params._example == "looped_animation"
          $example = LoopedAnimation::Game.new
        elsif params._example == "multiple_anims"
          $example = MultipleAnims::Game.new
        elsif params._example == "alpha_mask"
          $example = AlphaMask::Game.new
        elsif params._example == "dynamic-crop"
          $example = DynamicCrop::Game.new
        end
      end
      .watch!
    end
  end
end