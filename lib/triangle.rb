class Triangle
  # write code here
  attr_reader :l1, :l2, :l3

  def initialize l1, l2, l3
    @l1 = l1
    @l2 = l2
    @l3 = l3
  end

  def kind
    validate_triangle
    if l1 == l2 && l2 ==l3
      :equilateral
    elsif l1 == l2 || l2 == l3 || l1 == l3
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [l1, l2, l3].all?(&:positive?)
  end

  def valid_triangle_inequality?
    l1 + l2 > l3 && l1 + l3 > l2 && l2 + l3 > l1
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end
end
