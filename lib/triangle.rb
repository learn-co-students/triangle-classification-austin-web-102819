class Triangle
  attr_accessor :l1, :l2, :l3
  def initialize(l1, l2, l3)
    @l1 = l1
    @l2 = l2
    @l3 = l3
  end
  def kind
    validate_triangle
    if l1 == l2 && l1 ==l3
      :equilateral
    elsif l1 == l2 || l1 == l3 || l2 == l3
      :isosceles 
    elsif l1 != l2 && l1 != l3 && l2 != l3
      :scalene 
    end
  end
  def validate_triangle
    real = [(l1 + l2 > l3),(l1 + l3 > l2),(l3 + l2 > l1)]
    [l1,l2,l3].each {|side| real << false if side <= 0}
    raise TriangleError if real.include?(false)
  end

  class TriangleError < StandardError
     
  end
end
