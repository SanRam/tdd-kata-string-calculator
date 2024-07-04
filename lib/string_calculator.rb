module StringCalculator
  def self.add(input)
    return 0 if input.nil? || input.empty?
    # this should handle many numbers in a string with various delimiter cases
    numbers = input.scan(/-?\d*/m).map { |num| num.to_i }
    negatives = numbers.select(&:negative?)
    raise "negatives not allowed [#{negatives.join(',')}]" unless negatives.empty?
    numbers.sum

  end
end
