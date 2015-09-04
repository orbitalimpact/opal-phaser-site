# NOTE: the following code is slightly different from the code in the opal-phaser-examples repository, for compatibility with VoltRb
if RUBY_ENGINE == 'opal'
  module LoadTexture
    require 'opal-phaser'

    class Sprite
      def initialize(game)
        @mummy_key             = "mummy"
        @mummy_url             = "/app/examples/assets/sprites/metalslug_mummy37x45.png"
        @mummy_frames_width    = 37
        @mummy_frames_height   = 45
        @max_frames            = 18
    
        @monster_key           = "monster"
        @monster_url           = "/app/examples/assets/sprites/metalslug_monster39x40.png"
        @monster_frames_width  = 39
        @monster_frames_height = 40
    
        @game                  = game
      end
  
      def preload
        @game.load.spritesheet(@mummy_key, @mummy_url, @mummy_frames_width, @mummy_frames_height, @max_frames)
        @game.load.spritesheet(@monster_key, @monster_url, @monster_frames_width, @monster_frames_height)
      end
  
      def create
        change_texture = proc do
          if @sprite.key == @monster_key
            @sprite.load_texture(@mummy_key, 0, false)
          else
            @sprite.load_texture(@monster_key, 0, false)
          end
        end
    
        @sprite = @game.add.sprite(300, 200, @monster_key)
    
        @sprite.animations.add("walk", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])
        @sprite.animations.play("walk", 20, true)
        @sprite.scale.set(4)
        @sprite.smoothed = false
    
        @game.input.on(:down, &change_texture)
      end
    end

    class Game
      attr_reader :phaser_game
      def initialize
        @phaser_game = Phaser::Game.new(width: 800, height: 600, renderer: Phaser::AUTO, parent: "example")
        state        = MainState.new(@phaser_game)
        @phaser_game.state.add(:main, state, true)
      end
    end

    class MainState < Phaser::State
      def initialize(game)
        @sprite = Sprite.new(game)
      end
  
      def preload
        @sprite.preload
      end
  
      def create
        @sprite.create
      end
    end
  end
end