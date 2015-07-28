# NOTE: the following code is slightly different from the code in the opal-phaser-examples repository, for compatibility with VoltRb
if RUBY_ENGINE == 'opal'
  module DynamicCrop
    require 'opal-phaser'

    class DynamicCrop < Phaser::State
      def preload
        game.load.image('trsi', '/assets/pics/trsipic1_lazur.jpg')
      end

      def create
        @pic = game.add.sprite(0, 0, 'trsi')
        $pic = @pic

        @w = @pic.width
        @h = @pic.height

        @rect = Phaser::Rectangle.new(0, 0, 128, 128)
        $rect = @rect

        @pic.crop(@rect)
      end

      def update
        if (game.input.x < @w && game.input.y < @h)
          @pic.x = game.input.x
          @pic.y = game.input.y
          @rect.x = game.input.x
          @rect.y = game.input.y

          @pic.update_crop
        end
      end
    end

    class Game
      attr_reader :phaser_game
      def initialize
        @phaser_game = Phaser::Game.new(width: 800, height: 600, renderer: Phaser::AUTO, parent: "example")
        state        = DynamicCrop.new(@phaser_game)
        @phaser_game.state.add(:main, state, true)
      end
    end
  end
end