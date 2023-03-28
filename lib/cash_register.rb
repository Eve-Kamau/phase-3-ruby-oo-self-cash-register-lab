
class CashRegister

    attr_accessor :discount, :total, :items, :last_amount, :last_transactio

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @last_amount = 0
        @last_transaction = 0
    end

    def add_item(title, price, quantity = 1)
        count = 0
        while count < quantity do
        @items << title
        @last_amount = price * quantity
        @last_transaction = title
        count += 1
        end 
        self.total = self.total + self.last_amount
    end

    def apply_discount
        if self.discount == 0
            return "There is no discount to apply."
        else 
            self.total -= (self.total * (self.discount / 100.0)).to_i
            return "After the discount, the total comes to $#{self.total}."
        end
    end  
    
    def items 
        @items
    end 

    def void_last_transaction
        items.delete(@last_transaction)
        self.total -= self.last_amount
      end
end

pesa_till = CashRegister.new

pesa_till.add_item("Cup", 50, 10)
pesa_till.add_item("Saucer", 70, 10)
pesa_till.add_item("Bowl", 100, 5)

puts pesa_till.apply_discount
puts pesa_till.items
puts pesa_till.void_last_transaction

discount_till = CashRegister.new(20)
discount_till.add_item("Juice", 200, 1)
discount_till.add_item("Soda", 30, 20)
discount_till.add_item("Yoghurt", 100, 2)

puts discount_till.apply_discount
puts discount_till.items
puts discount_till.void_last_transaction