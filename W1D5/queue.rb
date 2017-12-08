class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
    el
  end

  def dequeue
    @queue.shift(el)
  end

  def show
    @queue.dup
  end
end
