module StringCalculator
  def self.add(input)
    return 0 if input.nil? || input.empty?
    # this should handle many numbers in a string with various delimiter cases
    numbers = input.scan(/-?\d*/m).map { |num| num.to_i }
    raise "negatives not allowed" if numbers.find(&:negative?)
    numbers.sum

  end
end
