module MiniTest
  module Chef
    class Runner < MiniTest::Unit
      attr_reader :run_status

      def initialize(run_status)
        @run_status = run_status
        super()
      end
    end
  end
end
