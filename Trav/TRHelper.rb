class TRHelper

  def self.subtract!(first, second)
    first.each_key do |key|
      first[key] -= second[key]
    end
  end

  def self.plus!(first, second)
    first.each_key do |key|
      first[key] += second[key]
    end
  end

  def self.time(first, second)
    result = {}
    first.each do |key, value|
      result[key] = value * second
    end
    result
  end

  def self.greater(first, second)
    first.values.inject(:+) <=> second.values.inject(:+)
  end

  def self.click_if_exists?(clickable)
    if clickable.exists?
      clickable.click
      true
    else
      false
    end
  end
end