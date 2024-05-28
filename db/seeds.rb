30.times do |count|
  title = Faker::Book.title
  body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
  Product.create(title: title, body: body)
end
