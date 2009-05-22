class MockContainer
  def initialize
    @times_called = 0
    @called_for
  end

  def resolve klass
    @called_for = klass
    @times_called = @times_called + 1
  end

  def times_resolve_called
     @times_called
  end

  def resolve_called_for_class
    @called_for
  end
end
