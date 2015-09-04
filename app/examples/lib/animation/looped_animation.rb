# NOTE: the following code is slightly different from the code in the opal-phaser-examples repository, for compatibility with VoltRb
if RUBY_ENGINE == 'opal'
  module LoopedAnimation
    require 'opal-phaser'

    class Bot
      def initialize(game)
        @sprite_key        = "bot"
        @sprite_img        = "/app/examples/assets/sprites/running_bot.png"
        @sprite_json       = "/app/examples/assets/sprites/running_bot.json"
    
        @bot_animation_key = "run"
    
        @game              = game
      end
  
      def preload
        @game.load.atlasJSONArray(@sprite_key, @sprite_img, @sprite_json)
      end
  
      def create
        @bot = @game.add.sprite(200, 200, @sprite_key)
    
        @bot.animations.add(@bot_animation_key)
    
        @bot.animations.play(@bot_animation_key, 15, true)
      end
  
      def update
        @bot.x -= 2
    
        if @bot.x < -@bot.width
          @bot.x = @game.world.width
        end
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
        @bot = Bot.new(game)
      end
  
      def preload
        @bot.preload
      end
  
      def create
        @bot.create
      end
  
      def update
        @bot.update
      end
    end
  end
end