class Sequence
  def self.order(reverse)
    @order_by = reverse
  end

  def self.whatorder
    @order_by
  end
end