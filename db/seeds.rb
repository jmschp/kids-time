# rubocop:disable Layout/LineLength, Style/AsciiComments, Security/Open(rubCopo)
require 'open-uri'

Order.destroy_all
Activity.destroy_all
User.destroy_all

# categories = ["Aniversário", "Ar livre", "Desporto", "Cozinha", "Livros", "Online", "Outros"]
users = []
activities = [
  {
    title: 'Campeonato de futebol',
    description: 'Venha jogar futebol no parque Vila Lobos com seus melhores amigos! Aqui com certeza vai sempre dar time. Não permita que ninguém roube os seus sonhos, só você pode correr atrás e realizá-los. Não perca a sua essência, acredite na magia da infância e continue vivendo em harmonia. Você tem a vida inteira pela frente, aproveite cada momento como se fosse o último!',
    category: ACTIVITY_CATEGORIES[3], duration: "8 horas", min_age: 12, price: 500,
    photo_url: ['https://source.unsplash.com/JJTymoqqNIQ', 'https://source.unsplash.com/c8moHj5YdFU', 'https://source.unsplash.com/sZhLJ6GydQA']
  },
  {
    title: 'Kart racing',
    description: 'Você poderá se sentir um verdadeiro piloto participando de uma bateria em nossos karts com motores Honda de 5 hp. Kart Mirim acoplado com motor Honda GX 160, banco regulável e proteção radial de polipropileno para os pequenos amantes do esporte.',
    category: ACTIVITY_CATEGORIES[3], duration: "25 minutos", min_age: 14, price: 150,
    photo_url: ['https://source.unsplash.com/u79XgGhg0Ww', 'https://source.unsplash.com/DXFJf4L7VeA', 'https://source.unsplash.com/jyGqc7NKucQ']
  },
  {
    title: 'Picnic no parque',
    description: 'Junte a familia e amigos, para aproveitar um picnic com as melhores guloseimas, com uma bela vista da praça Por do Sol. Saiba aproveitar cada instante da sua vida, você pode realizar todos os seus sonhos se correr atrás. Não perca a sua essência e viva em busca da sua paz. Faça a diferença no mundo e não perca a magia da infância que vive em seu coração',
    category: ACTIVITY_CATEGORIES[1], duration: "6 horas", min_age: 14, price: 150,
    photo_url: ['https://source.unsplash.com/VgItkeIq6Ek', 'https://source.unsplash.com/-7AxXbZekDE', 'https://source.unsplash.com/rKD8P8aY_1M']
  }
]

products = [
  {
    title: 'Balões de festa',
    description: 'Balões co vários formatos para animar a sua festa',
    category: ACTIVITY_CATEGORIES[0], min_age: 5, price: 200,
    photo_url: ['https://source.unsplash.com/m3JNF_96cxo', 'https://source.unsplash.com/uoKCEI1aQPU', 'https://source.unsplash.com/uGP_6CAD-14']
  },
  {
    title: 'Bolo de aniversário',
    description: 'Encomende agora o seu bolo de aniversário',
    category: ACTIVITY_CATEGORIES[0], min_age: 5, price: 200,
    photo_url: ['https://source.unsplash.com/8fltXe2_sL4', 'https://source.unsplash.com/Y1Ul14Qvdd0', 'https://source.unsplash.com/XbZgARqXROc']
  }
]

puts "Criando usuários"

2.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123123',
    address: Faker::Address.full_address
  )
  users << user
  photo = URI.open("https://source.unsplash.com/featured/?profile,picture")
  puts "User Photo"
  user.photo.attach(io: photo, filename: "#{user.name}.jpg", content_type: 'image/jpg')
  user.save!
end

puts "Usuários criados"

puts "Criando atividades"

activities.each do |activity|
  act = Activity.new(
    title: activity[:title],
    description: activity[:description],
    category: activity[:category],
    duration: activity[:duration],
    min_age: activity[:min_age],
    price: activity[:price],
    product_type: true,
    user: users.sample
  )

  activity[:photo_url].each_with_index do |photo_url, index|
    photo = URI.open(photo_url)
    filename = "#{activity[:title]}_#{index}.jpg"
    act.photos.attach(io: photo, filename: filename, content_type: 'image/jpg')
    act.save!
  end
end

puts "Atividades criadas"

puts "Criando produtos"

products.each do |product|
  prod = Activity.new(
    title: product[:title],
    description: product[:description],
    category: product[:category],
    min_age: product[:min_age],
    price: product[:price],
    product_type: true,
    user: users.sample
  )
  product[:photo_url].each_with_index do |photo_url, index|
    photo = URI.open(photo_url)
    filename = "#{product[:title]}_#{index}.jpg"
    prod.photos.attach(io: photo, filename: filename, content_type: 'image/jpg')
    prod.save!
  end
end

puts "Produtos criados"

# rubocop:enable Layout/LineLength, Style/AsciiComments, Security/Open(rubCopo)
