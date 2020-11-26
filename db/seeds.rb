# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

duration = ['1 dia', '5 horas', '2 horas', '12 horas', '3 horas', '8 horas', '1 hora']
categories = ["Aniversário", "Ar livre", "Casa", "Com Amigos", "Cozinha", "Livros", "Online", "Outros"]

users = []

seeds = [
  ['Futebol', 'Venha jogar futebol no parque Vila Lobos com seus melhores amigos! Aqui com certeza vai sempre dar time. Não permita que ninguém roube os seus sonhos, só você pode correr atrás e realizá-los. Não perca a sua essência, acredite na magia da infância e continue vivendo em harmonia. Você tem a vida inteira pela frente, aproveite cada momento como se fosse o último!',
   categories[1]],
  ['Picnic', 'Junte a familia e amigos, para aproveitar um picnic com as melhores guloseimas, com uma bela vista da praça Por do Sol. Saiba aproveitar cada instante da sua vida, você pode realizar todos os seus sonhos se correr atrás. Não perca a sua essência e viva em busca da sua paz. Faça a diferença no mundo e não perca a magia da infância que vive em seu coração',
   categories[1]],
  ['Jogos de mesa', 'Venha brincar com mais de 23 opções de jogos de tabuleiro. Seu filho ficara nos confortos da nossa casa, com acompanhamento de BaBá, para que não engulam as peças! Nunca apague a criança que existe dentro de você, permita que ela exista! Saiba que a caminhada da vida é longa e que você precisa estar preparado para qualquer situação. Lembre-se de sempre batalhar pelos seus sonhos e pelas suas escolhas. Nada acontece por acaso! Acredite nos seus sonhos, pois tudo tem um propósito.',
   categories[2]],
  ['Aprenda a fazer Cookies', 'Aprenda a melhor receita de cookies para encantar todos a sua volta, venha com todos seus filhos, diversão e satisfação garantida. Ei, não se esqueça de viver em busca do melhor futuro para ti. Sua vida ainda é muito longa, mas passa depressa, então não deixe de aproveitar cada momento. Curta as suas fases, acredite nos seus sonhos e faça tudo sempre pensando com bom senso e amor.',
   categories[4]],
  ['Aula de Teatro', 'Aqui seu filho vai se sentir livre pra voar, onde o poder de sua imaginação se torna realidade com jogos os melhores jogos teatrais de improviso! Não deixe de viver a sua realidade por ficar se comparando com alguém. Você tem a sua vida, ela é incrível e perfeita para ti. Saiba valorizar cada momento que você vive, tudo é um aprendizado e tudo tem um propósito. Vale a pena sorrir em todos os dias e evoluir acima de qualquer coisa.',
   categories[6]],
  ['Contar de história', 'Temos um grande arquivo de livros, onde seu filho escolhe o seu favorito para lermos com as melhores técnicas de ASMR. Queria eu, ter a pureza de uma criança. Sorrir ao ganhar um presente sem se importar com o valor que foi gasto. Pegar o cobertor pela manhã e ir assistir o desenho favorito. Ir para a escola pensando em brincar. Chorar já com saudade da mãe ao vê-la se retirando para ir trabalhar. Gritar pelo nome do pai ao ter um pesadelo. Não se preocupar com os problemas do mundo, e sim com o horário do lanchinho da tarde.',
   categories[5]],
  ['Fogueira', 'Pronto para um marshmallow na brasa? Cante a beira da fogueira, aproveitando marshmellow, escutando as histórias da monitoria. Bons tempos os de criança! Tempo em que tudo era uma brincadeira, tudo era alegria, tempo que não volta mais, restando assim, somente lembranças, daquele tempo de criança que os anos não trazem mais e que a saudade, se encarrega de guardar com tanto carinho e amor',
   categories[3]],
  ['Sarau com músicas ao vivo', 'Assita ao nosso time de cantores, músicos fazer a alegria das crianças. A atenção dos pequenos se volta na hora a voz doce de nossa cantora Jurema,ganhamos o prêmio Evarista Jr. de comunicação infantil, começamos fazendo teatro de fantoche no Bobs Restaurante, e hoje somos referencia em cantar histórias',
   categories[0]],
  ['Competição de Dança', 'Faremos nosso próprio reality show em casa. Onde as crianças presentes competiram pela melhor dança, não é para ver quem ganha, mais pela diversão!!! Quer relaxar, não vai pescar, vem dançar!!! Seja gentil com os seus amiguinhos, ajude-os sempre que precisarem. Seja com um abraço, um sorriso, compartilhando o seu lanche, ouvindo, conversando, falando sobre os seus sonhos e abrindo o seu coração. Faça sempre o bem, pois você será mais feliz desse jeito!',
   categories[3]],
  ['Teatro de fantoche', 'Assita a melhor trupe de teatro infantil  de Uberaba, ganhamos o prêmio Evarista Jr. de comunicação infantil, começamos fazendo teatro de fantoche no Mac Donalds, e hoje somos referencia em contar histórias. Você que é criança, não se apresse em crescer! O tempo já passa depressa demais por natureza, e o melhor a fazer é aproveitar cada dia para brincar, correr e descobrir o melhor que o mundo tem para oferecer. Acredite que um dia você chegará à idade adulta e sentirá saudade da sua infância. Na verdade, nada se comparar a ela. Aproveite cada segundo sem pensar no amanhã, dê asas à sua imaginação e sonhe muito. Ser criança é ser feliz com coisas simples, é ter a liberdade de ser especial.',
   categories[0]],
  ['Caça ao tesouro', 'Espalhamos dicas por toda casa, quem chegar ao tesouro, leva ele pra casa. Pra quem achar o tesouro não vai faltar, guloseimas nem diversão! Ser criança é assim... Correr até acabar o fôlego, rolar pelo chão sem medo de se sujar, falar o que vier na cabeça e fazer de qualquer coisa uma brincadeira. Época da vida da qual temos saudades quando envelhecemos.',
   categories[2]],
  ['Mini Pizza', 'Aprenda a fazer mini pizza. Desde o molho de tomate, a massa até a decoração final. Vamos aprender a fazer pizza de mussarela, portuguesa, 4 queijos e toscana. Tudo com muita diversão!!! Como é bom ser criança e ter o dia para sonhar sem se preocupar com o amanhã. Brincar até à exaustão e depois dormir sem remorsos ou pesadelos. Bagunçar tudo sem depois ter que arrumar. Fazer birra e chorar e minutos depois estar novamente rindo com toda a energia. Viver entre dois mundos, o real e o de fantasia, e em todos ser feliz.',
   categories[4]],
  ['Aula de Skate', 'Venha na pista de skate do parque Ibirapuera para uma aula inesquecível. temos capacete e joelheira para toda proteção necessária. Após a aula entregamos um Ticket para criança que vale uma água de coco, e um milho com manteiga, na barraca do Betão. O amor de uma criança é o único sentimento incapaz de machucar. É o amor na sua maneira mais pura e genuína, o amor de quem quer ver o outro bem, independentemente do que for preciso fazer. É o amor de quem enxerga na felicidade do outro a própria felicidade. É o amor que cuida, que compreende e que cura qualquer mal. Os pequenos que mal sabem ao certo o que é amar nos ensinam mais que qualquer adulto é capaz. Para todas as dores da vida, um amor sincero de criança.',
   categories[1]],
  ['Passeio de bicicleta', 'Venha andar de bicleta no parque Ibirapuera para um dia inesquecível. Após a aula entregamos um Ticket para criança que vale uma água de coco, e um milho com manteiga, na barraca do Betão. As crianças são como raios de sol em dias nublados. Elas nos fazem acreditar que o mundo é bom, mesmo depois de tantas decepções. Elas nos fazem lembrar a importância de ser sincero e de sorrir de forma genuína até mesmo por causa dos menores motivos. As crianças nos fazem lembrar que a vida não precisa ser pesada e que tudo depende da maneira como olhamos o mundo. Nos dias nublados, as crianças aparecem como raios de sol para nos lembrar de que o dia sempre nasce de novo e de que, após a tempestade, o arco-íris aparece.',
   categories[1]],
  ['Horta', 'Vamos aprender como fazer uma horta. Vamos plantar girassóis, feijão, cenoura, pimenta, alho e outras maravilhas da nossa terra. Aqui as crianças entendem o valor de cuidar e cultivar nossa terra. Criança deve ser tudo que quiser, mas o que realmente importa é que seja feliz. Que sorria o tempo todo. Que sonhe e sonhe muito. Que a sua imaginação cheia de cores seja sua condutora e brote livremente a toda hora. Criança deve ser feliz sempre, não ter pesos no pensamento, preocupações ou decepções. Pois assim crescerá forte, e se tornará um adulto saudável e feliz.',
   categories[1]],
  ['Escultura de balões', 'Aprenda a esculturas em balões. Aprenderemos a fazer  cachorro, coelho, casinha,flores e muito mais! Tudo com muita imaginação e diversão! Como é gostoso olhar para o mundo e encontrar uma novidade em cada canto, ver a vida com curiosidade e sentir um deslumbre em descobrir coisas novas. A criança tem uma visão desprovida de preconceitos e julgamentos e essa pureza deve ser conservada ao máximo.',
   categories[4]],
  ['Show de Mágica', 'Comemore seu aniversário com o melhor show de mágica de São Paulo. Mágicas inéditas, jamais vistas online em qualquer lugar. Oportunidade única! Além disso as crianças aprenderam a fazer alguns truques para surpreender seus familiares e amigos. Ser criança é ser feliz com pouco ou nada, e ter tudo o que precisa ao alcance de um sonho. Ser criança é ser luz e bondade, inocência e pureza. Por isso cresça, mas nunca deixe parte da sua criança interior desaparecer totalmente. Guarde um pedaço da mágica que é ser criança para sempre, e nunca lhe faltará alegria.',
   categories[0]],
  ['Vôlei', 'Venha brincar com todos seus amigos do esporte que mais cresce no brasil. Aqui sempre da time, pode trazer seus amigos que tem sempre espaço! Se encontramos no parque do povo para jogar ate cansar! Relaxa que tem barquinhas de comida em todo parque. As crianças são a luz do mundo, a alegria do presente e a esperança do futuro. Nas suas mãozinhas pequenas se começa a construir o amanhã, e nos seus coraçõezinhos bate já a ambição do que virá.',
   categories[3]],
  ['Brinquedoteca', 'Venha brincar com todos seus amigos no quarto de brinquedos mais legal! Aqui sempre tem brinquedo novo pra inspirar suas crianças, pode trazer seus amigos que tem sempre espaço! Temos desde de carrinhos, pista da hot-wheels, até bonecas da Yiuly Brule. Espero que você tenha se comportado bem durante todo o ano, pois o Papai Noel esteve atento e na hora de distribuir os presentes, apenas os bem-comportados vão receber muitos. Mas eu sei que você se portou muito bem, pois é uma criança adorável e muito especial. Por isso não duvido que encontrará seu sapatinho cheio de presentes.',
   categories[2]],
  ['Campeonato de Fifa', 'A maior comeptição de fifa do Kidstime está aqui. O vencedor leva 1 sorvete kibon 2l e uma passagem para o hop harry. Sorteamos todos os times então esteja pronto! Você precisa de sonhos para continuar sua motivação pela vida, não desista do que você sempre quis. Continue lutando, batalhando e desejando, só você pode correr atrás. Lembre-se sempre de ser positivo, ajudar os outros e fazer sua parte. Tudo é retribuído quando fazemos por amor!',
   categories[2]],
  ['Observação de pássaros', 'Venha aprender sobre os pássaros que estão na nossa volta todos os dias e não sabemos nada sobre eles. Traga conhecimento para você e seus filhos, além de aproveitar um dia incrível, com vistas inesquecíveis. Afinal, ser criança está na idade ou no coração? Sei que levo em mim uma juventude sem fim, não importa quantos anos tenho. Minha vida é uma eterna brincadeira e qualquer momento é hora de diversão. Meu coração é eternamente criança!',
   categories[1]],
  ['Piscina', 'Venha brincar com todos seus amigos em uma piscina que sempre está quentinha, pode trazer seus amigos que tem sempre espaço! Vamos aprender a nadar, ou jogar marco polo ate cansar! Relaxa que tem comida pra todo mundo! Não anda fácil ser criança. Eu só quero brincar, me divertir e curtir os meus amigos, mas o tempo todo vem alguém me lembrar de que o futuro está perto e que logo já vou ter mil responsabilidades. Vivem dizendo que eu preciso viver o momento, que só o agora que importa, mas como eu vou conseguir aproveitar se estão o tempo todo falando que estou crescendo e que daqui a pouco minha vida vai mudar. Me deixem em paz! Até parece que estão com inveja de mim só porque eu ainda sou criança!',
   categories[2]],
  ['Pesca', 'Temos tilapia, e linguado em 3 lagos para sua criança aproveitar o dia todo pescando. Fazemos o peixe que seus filhos pescarem na hora, na churrasqueira. Tudo para um dia lindo e inesquecível, seu chover não deixe de vir, temos capas de chuva! No sorriso de uma criança não vive só encanto e pureza, mas também a esperança de um futuro melhor. Pois em cada criança hoje está um pedaço do mundo amanhã. Pequenas agora, grandes depois, as crianças serão o reflexo do que viveram na infância. Por isso cuidemos das nossas crianças, lutemos pela felicidade delas para que cresçam felizes e se tornem adultos bons e responsáveis.',
   categories[1]]
]

10.times do
  users << User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123123',
    address: Faker::Address.full_address
  )
end

seeds.each do |seed|
  act = Activity.new(
    title: seed[0],
    description: seed[1],
    category: categories.sample,
    duration: duration.sample,
    min_age: rand(2..10),
    price: rand(50..500)
  )
  act.user = users.sample
  act.save

  url = "https://source.unsplash.com/featured/?kids,#{seed[3]}"
  photo = URI.open(url)
  act.photo.attach(io: photo, filename: "#{seed[0]}.jpg", content_type: 'image/jpg')
end
