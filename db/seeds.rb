# rubocop:disable Layout/LineLength, Style/AsciiComments, Security/Open(rubCopo)

Order.destroy_all
Activity.destroy_all
User.destroy_all

# categories = ["Aniversário", "Ar livre", "Desporto", "Cozinha", "Livros", "Online", "Outros"]
users = []
activities = [
  {
    title: 'Campeonato de futebol',
    description: 'Venha jogar futebol no parque Vila Lobos com seus melhores amigos! Aqui com certeza vai sempre dar time. Não permita que ninguém roube os seus sonhos, só você pode correr atrás e realizá-los. Não perca a sua essência, acredite na magia da infância e continue vivendo em harmonia. Você tem a vida inteira pela frente, aproveite cada momento como se fosse o último!',
    category: Activity::ACTIVITY_CATEGORIES.sample, duration: "8 horas", min_age: 12, price: 550.25,
    photo_url: ['https://source.unsplash.com/JJTymoqqNIQ', 'https://source.unsplash.com/c8moHj5YdFU', 'https://source.unsplash.com/sZhLJ6GydQA']
  },
  {
    title: 'Kart racing',
    description: 'Você poderá se sentir um verdadeiro piloto participando de uma bateria em nossos karts com motores Honda de 5 hp. Kart Mirim acoplado com motor Honda GX 160, banco regulável e proteção radial de polipropileno para os pequenos amantes do esporte.',
    category: Activity::ACTIVITY_CATEGORIES.sample, duration: "25 minutos", min_age: 14, price: 150.60,
    photo_url: ['https://source.unsplash.com/u79XgGhg0Ww', 'https://source.unsplash.com/DXFJf4L7VeA', 'https://source.unsplash.com/jyGqc7NKucQ']
  },
  {
    title: 'Picnic no parque',
    description: 'Junte a familia e amigos, para aproveitar um picnic com as melhores guloseimas, com uma bela vista da praça Por do Sol. Saiba aproveitar cada instante da sua vida, você pode realizar todos os seus sonhos se correr atrás. Não perca a sua essência e viva em busca da sua paz. Faça a diferença no mundo e não perca a magia da infância que vive em seu coração',
    category: Activity::ACTIVITY_CATEGORIES.sample, duration: "6 horas", min_age: 5, price: 155.20,
    photo_url: ['https://source.unsplash.com/VgItkeIq6Ek', 'https://source.unsplash.com/-7AxXbZekDE', 'https://source.unsplash.com/rKD8P8aY_1M']
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
  user.photo.attach(io: photo, filename: "#{user.name}.jpg", content_type: 'image/jpg')
  user.save!
end

puts "Criando atividades"

3.times do
  activities.each do |activity|
    act = Activity.new(
      title: activity[:title],
      description: activity[:description],
      category: activity[:category],
      duration: activity[:duration],
      min_age: activity[:min_age],
      price: activity[:price],
      user: users.sample
    )

    activity[:photo_url].each_with_index do |photo_url, index|
      photo = URI.open(photo_url)
      filename = "#{activity[:title]}_#{index}.jpg"
      act.photos.attach(io: photo, filename: filename, content_type: 'image/jpg')
      act.save!
    end
  end
end

# rubocop:enable Layout/LineLength, Style/AsciiComments, Security/Open(rubCopo)
