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
  return cart if coupons == []

  new_cart = cart

  coupons.each do |coupon|
    name = coupon[:item] 
    num_of_c = coupon[:num]
    if cart.include?(name) && cart[name][:count] >= num_of_c
       #remove number of the new_cart's count
       new_cart[name][:count] -= num_of_c
       #increase the count when there is more items than the coupon allows
       if new_cart["#{name} W/COUPON"]
         new_cart["#{name} W/COUPON"][:count] += 1
       #set the name with coupon with new value
       else
         new_cart["#{name} W/COUPON"] = {
           :price => coupon[:cost],
           :clearance => new_cart[name][:clearance],
           :count => 1
         }
       end
     end
   end
   new_cart
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

