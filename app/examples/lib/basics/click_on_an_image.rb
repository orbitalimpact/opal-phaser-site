# NOTE: the following code is slightly different from the code in the opal-phaser-examples repository, for compatibility with VoltRb
if RUBY_ENGINE == 'opal'
  require 'opal-phaser'

  module ClickOnAnImage

    class Image
      def initialize(game)
        @sprite_key = "einstein"
        @sprite_url = "/assets/pics/ra_einstein.png"
        @game       = game
      end

      def preload
        @game.load.image(@sprite_key, @sprite_url)
      end

      def create
        @counter = 0

        listener = proc do
          @counter   += 1
          @text.text = "You clicked #{@counter} times!"
        end

        @image = @game.add.sprite(@game.world.x_center, @game.world.y_center, @sprite_key)
        @image.anchor.set(0.5)

        @image.input_enabled = true

        @text = @game.add.text(250, 16, '', { fill: '#ffffff' })

        @image.events.on(:down, self, &listener)
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
        @image = Image.new(@game)
        @image.preload
      end

      def create
        @image.create
      end
    end
  end
end