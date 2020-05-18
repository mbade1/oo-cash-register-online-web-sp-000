class CashRegister

  attr_accessor :total, :discount, :last_transaction_amount, :items

  def initialize(discount = 0)
    #set instance var @total to 0
    @total = 0
    #takes in discount var and make it an instance var
    @discount = discount
    #create items array to shovel new items into.
    @items = []
  end

  def add_item(title, price, quantity = 1)
    #if there are more than 1 items, shovel each individual item into the @items []
    if quantity > 1
      i = 0
      while i < quantity
        @items << title
        i += 1
      end
      #if there's just one item, shovel that one item into the array
    else
      @items << title
    end
    #the new total includes the price*quantity added in.
    @total += price*quantity
    @last_transaction_amount = price*quantity
    @total
  end

  def apply_discount
    #if there's a discount
    if @discount > 0
      #create a float to multiply that discount to the @total.
      @discount = @discount/100.to_f
      #the @total is equal to the @total minus the discounted total.
      @total = @total - (@total * @discount)
      #tell the user how much the discounted total is.
      "After the discount, the total comes to $#{@total.to_i}."
    else
      #if there's no discount available, tell the user.
      "There is no discount to apply."
    end
  end

  def void_last_transaction
      @total -= @last_transaction_amount
  end
end
