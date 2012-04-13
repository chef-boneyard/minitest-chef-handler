module MiniTest
  module Chef
    module Context
      attr_reader :run_status, :node, :run_context

      def run(runner)
        if runner.respond_to?(:run_status)
          @run_status = runner.run_status
          @node = @run_status.node
          @run_context = @run_status.run_context
        end
        super(runner)
      end
    end
  end
end
