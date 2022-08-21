class CashRegister
    attr_reader :discount, :total , :price, :quantity, :title, :items
    attr_accessor :accumulated_price
    def initialize (discount=0)
        @total = 0
        @discount = discount
        @items = []
         @accumulated_price = 0
    end
    def total=(total)
    @total = total
    end
    def add_item(title, price, quantity=1)
        self.accumulated_price = price * quantity
        self.total += self.accumulated_price
        quantity.times {self.items << title}
        # total_items = "#{title}!" * quantity
        # self.items << total_items.split("!")
        # self.items.flatten        
    end 
    def apply_discount
        if self.discount > 0
        self.total = self.total - (self.total * self.discount/100)
        "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end
    def void_last_transaction
    self.total -= self.accumulated_price
    end
end
