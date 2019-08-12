require 'pry'

def consolidate_cart(cart)
  cart_new = {}
  cart.each do |item_array| 
    # binding.pry
    item_array.each do |item, attribute_hash|
      cart_new[item] ||= attribute_hash
      cart_new[item][:count] ? cart_new[item][:count] +=1 : cart_new[item][:count] = 1
    end
  end
  cart_new
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon| 
    coupon.each do |attribute, value| 
      name = coupon[:item] 
      new_coupon_hash = {
      :price => coupon_hash[:cost],
      :clearance => "true",
      :count => coupon_hash[:num]
    }
    
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
  total = 0 
  new_cart = consolidate_cart(cart) 
  coupon_cart = apply_coupons(new_cart, coupons) 
  clearance_cart = apply_clearance(coupon_cart) 
  clearance_cart.each do |item, attribute_hash| 
    total += (attribute_hash[:price] * attribute_hash[:count])
  end 
total = (total * 0.9) if total > 100 

end

