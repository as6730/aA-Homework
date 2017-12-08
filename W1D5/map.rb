class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    @map.each do |subarr|
      if subarr[0] == key
        subarr[1] = value
        return nil
      end
    end

    @map << [key, value]
  end

  def lookup(key)
    @map.each do |subarr|
      if subarr[0] == key
        return subarr[1]
      end
    end

    nil
  end

  def remove(key)
    @map.reject! do |subarr|
      subarr[0] == key
    end
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
