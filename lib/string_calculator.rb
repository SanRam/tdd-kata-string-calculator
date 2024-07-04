module StringCalculator
  # stores the amount of times add method is called
  @@add_count = 0

  def self.add(input)
    @@add_count = @@add_count + 1
    return 0 if input.nil? || input.empty?
    # this should handle many numbers in a string with various delimiter cases
    numbers = input.scan(/-?\d*/m).map { |num| num.to_i }
    negatives = numbers.select(&:negative?)
    raise "negatives not allowed [#{negatives.join(',')}]" unless negatives.empty?
    numbers.select { |num| num <= 1000 }.sum
  end

  def self.get_called_count
    @@add_count
  end
end
