module Contracts
  def self.included(base) common(base) end
  def self.extended(base) common(base) end

  def self.common(base)
    base.class_eval do
      def Contract(*args)
      end

      def self.Contract(*args)
      end
    end

    unless base <= eigenclass_of(Object)
      eigenclass_of(base).send(:include, Contracts)
    end
  end

  def self.eigenclass_of(base)
    class << base; self; end
  end

  module Invariants
    def self.included(base) common(base) end
    def self.extended(base) common(base) end

    def self.common(base)
      base.class_eval do
        def Invariant(*args)
        end

        def self.Invariant(*args)
        end
      end
    end
  end

  module Modules
  end

  class CallableClass
    def self.[](*args)
    end
  end

  Num = CallableClass
  Or = CallableClass
  Bool = CallableClass
  Any = CallableClass
  Args = CallableClass
  Func = CallableClass
  ArrayOf = CallableClass
  Pos = CallableClass
  Neg = CallableClass
  Nat = CallableClass
  None = CallableClass
  Xor = CallableClass
  RespondTo = CallableClass
  And = CallableClass
  Send = CallableClass
  Not = CallableClass
  Maybe = CallableClass
  HashOf = CallableClass
  Exactly = CallableClass
  Eq = CallableClass

end
