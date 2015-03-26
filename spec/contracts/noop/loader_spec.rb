require "contracts/noop/loader"

module Contracts
  module Noop
    RSpec.describe Loader do
      let(:spy) { double("spy") }
      let(:rescue_strategy) { lambda { spy.failed } }

      subject { described_class.new(load_strategy, rescue_strategy) }

      describe "#load" do
        context "when able to load" do
          let(:load_strategy) { lambda { spy.load } }

          it "executes block" do
            expect(spy).to receive(:load).ordered.once
            expect(spy).to receive(:done).ordered.once
            expect(spy).not_to receive(:failed)

            subject.load do
              spy.done
            end
          end

          it "does not rescue if block failed with LoadError" do
            expect(spy).to receive(:load).ordered.once
            expect(spy).not_to receive(:done)
            expect(spy).not_to receive(:failed)

            expect {
              subject.load do
                raise LoadError
                spy.done
              end
            }.to raise_error(LoadError)
          end
        end

        context "when unable to load" do
          let(:load_strategy) { lambda { raise LoadError } }

          it "doesn't execute block and call rescue_strategy" do
            expect(spy).not_to receive(:load)
            expect(spy).not_to receive(:done)
            expect(spy).to receive(:failed)

            subject.load do
              spy.done
            end
          end
        end
      end
    end
  end
end
