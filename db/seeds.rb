# 2.times do |count|
#   title = Faker::Book.title
#   body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
#   Product.create(title: title, body: body)
# end

# Product.all.each do |product|
#   product.terms.create(date: Date.current)
#   product.terms.create(date: Date.current + 1.week)
# end

# 3.times do |count|
#   Term.all.each do |term|
#     name = Faker::Book.title
#     description = Faker::Lorem.paragraph(sentence_count: 1)
#     term.position.create(name: name, description: description, quantity: count, unit_price: count + 2)
#   end
# end
Company.create(name: 'Space')
Company.create(name: 'Lesiy')

User.create(email: 'dan1@ukr.net', password: 'password', company_id: 1)
User.create(email: 'dan2@ukr.net', password: 'password', company_id: 1)
User.create(email: 'dan3@ukr.net', password: 'password', company_id: 2)