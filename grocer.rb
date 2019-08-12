require 'pry'

def consolidate_cart(cart)
  consolidated_cart = {}
  cart.each do |item_array| 
    # binding.pry
    item_array.each do |item, attribute_hash|
      consolidated_cart[item] ||= attribute_hash
      consolidated_cart[item][:count] ? consolidated_cart[item][:count] +=1 : consolidated_cart[item][:count] = 1
    end
  end
  consolidated_cart
end

def apply_coupons(cart, coupons)
  
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
