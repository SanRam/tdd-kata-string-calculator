module StringCalculator
  def self.add(input)
    if input.nil? || input.empty?
      0
    else
      numbers = input.split(",").map { |num| num.to_i }
      numbers.sum
    end
  end
end
