# NOTE: the following code is slightly different from the code in the opal-phaser-examples repository, for compatibility with VoltRb
if RUBY_ENGINE == 'opal'
  module RenderText
    class Text
      def initialize(game)
        @game = game
      end
  
      def create
        text  = "- phaser -\n with a sprinkle of \n pixi dust."
        style = { font: "65px Arial", fill: "#ff0044", align: "center" }
    
        rendered_text = @game.add.text(@game.world.x_center - 300, 0, text, style)
      end
    end

    class Game
      attr_reader :phaser_game
      def initialize
        @phaser_game = Phaser::Game.new(width: 800, height: 600, renderer: Phaser::CANVAS, parent: "example")
        state        = MainState.new(@phaser_game)
        @phaser_game.state.add(:main, state, true)
      end
    end

    class MainState < Phaser::State
      def initialize(game)
        @game = game
      end
  
      def create
        @text = Text.new(game)
        @text.create
      end
    end
  end
end