2.times do |count|
  title = Faker::Book.title
  body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
  Product.create(title: title, body: body)
end

Product.all.each do |product|
  product.terms.create(date: Date.current)
  product.terms.create(date: Date.current + 1.week)
end
