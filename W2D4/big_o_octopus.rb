require 'byebug'
FISH_ARRAY = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# quadratic, O(n^2)

def sluggish_octopus(array = FISH_ARRAY)
  (0...array.length).each do |i|
    curr_fish = array[i]
    (0...array.length).each do |j|
      if curr_fish.length < array[j].length
        curr_fish = ''
      end
    end
    return curr_fish if curr_fish == array[i]
  end
end

# merge sort, O(n log n)

def dominant_octopus
  merge_sort[-1]
end

def merge_sort(array = FISH_ARRAY)
  return array if array.length <= 1

  mid_idx = array.length / 2
  left = array[0...mid_idx]
  right = array[mid_idx..-1]

  merged(merge_sort(left), merge_sort(right))
end

def merged(left, right)
  prc = Proc.new {|a, b| a <=> b }
  merged = []

  until left.empty? || right.empty?
    case prc.call(left[0].length, right[0].length)
      when 0
        merged << left.shift
      when -1
        merged << left.shift
      when 1
        merged << right.shift
    end
  end

  merged.concat(left).concat(right)
end

# linear search, O(n)

def clever_octopus(array = FISH_ARRAY)
  longest_fish = ''

  array.each do |el|
    longest_fish = el if longest_fish.length < el.length
  end

  longest_fish
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# linear, O(n)

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return idx if direction == tile
  end
end

# constant, O(1)

new_tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def constant_dance(direction, new_tiles_hash)
  new_tiles_hash[direction]
end
