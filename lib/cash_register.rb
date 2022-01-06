# require "pry"
class CashRegister
  attr_accessor :total, :discount, :items_array, :last_transaction_item, :last_transaction_price
  
  def initialize(discount = 0)
    @total = 0.00
    @discount = discount
    @items_array = []
    @last_transaction_item = ""
    @last_transaction_price = 0
  end

  def add_item(title, price, quantity = 1)
    self.total += quantity * price
    quantity.times do
      self.items_array.append(title)
    end
    self.last_transaction_item = title
    self.last_transaction_price = quantity * price
  end

  def apply_discount
    discountt = self.discount.to_f
    if discountt != 0 
      self.total -= discountt / 100 * self.total
      return "After the discount, the total comes to $#{self.total.to_i}."
    elsif discountt == 0
      return "There is no discount to apply."
    end
  end

  def items
    self.items_array
  end

  def void_last_transaction
    self.items_array.pop
    self.total -= self.last_transaction_price
  end
    # binding.pry
end