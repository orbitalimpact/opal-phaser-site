# NOTE: the following code is slightly different from the code in the opal-phaser-examples repository, for compatibility with VoltRb
if RUBY_ENGINE == 'opal'
  module LoadAnAnimation
    class Bot
      def initialize(game)
        @sprite_key = "bot"
        @sprite_url = "/app/examples/assets/sprites/running_bot.png"
        @json_url   = "/app/examples/assets/sprites/running_bot.json"
        @game       = game
      end
  
      def preload
        @game.load.atlasJSONArray(@sprite_key, @sprite_url, @json_url)
      end
  
      def create
        bot = @game.add.sprite(200, 200, @sprite_key)
    
        bot.animations.add("run")
    
        bot.animations.play("run", 15, true)
      end
  
      def method_missing(method)
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
        @game = game
      end
  
      def preload
        @bot = Bot.new(@game)
        @bot.preload
      end
  
      def create
        @bot.create
      end
    end
  end
end