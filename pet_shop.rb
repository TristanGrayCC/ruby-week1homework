def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,cash)
  pet_shop[:admin][:total_cash] += cash
  return pet_shop[:admin][:total_cash]
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, pet_sold)
  pet_shop[:admin][:pets_sold] += pet_sold
  return pet_shop[:admin][:pets_sold]
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  pets = []
   for pet in pet_shop[:pets]
      if pet[:breed] == breed
        pets << pet[:name]
      end
   end
   return pets
end

def find_pet_by_name(pet_shop,name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop,name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop,new_pet)
  pet_shop[:pets]<<new_pet
end

def customer_pet_count(customers)
  customers[:pets].count
end

def add_pet_to_customer(customer,new_pet)
  customer[:pets]<<new_pet
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] < new_pet[:price]
    return false
  elsif customer[:cash] >= new_pet[:price]
    return true
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  return if pet != nil && !customer_can_afford_pet(customer, pet)
    for each_pet in pet_shop[:pets]
      if each_pet == pet
        add_or_remove_cash(pet_shop,pet[:price])
        add_pet_to_customer(customer, pet)
        increase_pets_sold(pet_shop, 1)
        remove_pet_by_name(pet_shop, pet[:name])
      end
    end
  return nil
end
