module StringCalculator
  def self.add(input)
    if input.nil? || input.empty?
      0
    else
      # this should handle many numbers in a string with delimiter
      numbers = input.split(",").map { |num| num.to_i }
      numbers.sum
    end
  end
end
