class UseLayout
  attr_reader :actual, :expected
  
  def initialize(expected)
    @expected = 'layouts/' + expected
  end

  def matches?(controller)
    @actual = controller.layout
    @actual == @expected
  end

  def failure_message
    return "use_layout expected #{@expected.inspect}, got #{@actual.inspect}"
  end

  def negeative_failure_message
    return "use_layout expected #{@expected.inspect} not to equal #{@actual.inspect}"
  end
end


def use_layout(expected)
  UseLayout.new(expected)
end
