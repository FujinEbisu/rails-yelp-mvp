require 'faker'
print "Cleaning database..."
Review.delete_all
Restaurant.delete_all

print "Creating restaurants..."
10.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w(chinese italian japanese french belgian).sample,
    image: Faker::Avatar.image,
  )
end
print "Done restaurants!"

print "Creating reviews..."
10.times do
  Review.create!(
    content: Faker::Restaurant.review,
    restaurant_id: Restaurant.all.sample.id
  )
end
print "Done reviews!"
