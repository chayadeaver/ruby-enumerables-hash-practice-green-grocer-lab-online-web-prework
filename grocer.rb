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
  coupons.each do |coupon| 
    coupon.each do |attribute, value| 
      name = coupon[:item] 
    
      if cart[name] && cart[name][:count] >= coupon[:num] 
        if cart["#{name} W/COUPON"] 
          cart["#{name} W/COUPON"][:count] += 1 
        else 
          cart["#{name} W/COUPON"] = {:price => coupon[:cost], 
          :clearance => cart[name][:clearance], :count => 1} 
        end 
  
      cart[name][:count] -= coupon[:num] 
    end 
  end 
end 
  cart
end

def apply_clearance(cart)
  cart.each do |item, attribute_hash| 
    if attribute_hash[:clearance] == true 
      attribute_hash[:price] = (attribute_hash[:price] *
      0.8).round(2) 
    end 
  end 
cart
end

def checkout(cart, coupons)
  # code here
end
