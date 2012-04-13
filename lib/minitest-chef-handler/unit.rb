module MiniTest
  module Chef
    require 'minitest/unit'

    class TestCase < MiniTest::Unit::TestCase
      include Context
    end
  end
end
