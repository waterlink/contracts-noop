module Contracts
  module Noop
    class Loader
      def initialize(load_strategy, rescue_strategy)
        @load_strategy = load_strategy
        @rescue_strategy = rescue_strategy
      end

      def load(&blk)
        blk.call if _load
      end

      private

      def _load
        @load_strategy.call
        true
      rescue LoadError
        @rescue_strategy.call
        false
      end
    end
  end
end
