require "contracts/noop/version"
require "contracts/noop/loader"

module Contracts
  module Noop
    def self.when_contracts_available(&blk)
      Loader.new(lambda { require "contracts" },
                 lambda { require "contracts/noop/fake" })
        .load(&blk)
    end
  end
end
