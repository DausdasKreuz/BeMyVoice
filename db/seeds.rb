# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'


# Create professionals
professional_1 = ['Dani Garcia', 'dani@bmv.io', 'professional', 'secret', 'secret']
professional_2 = ['Ana Toscano', 'ana@bmv.io', 'professional', 'secret', 'secret']
professional_container = [professional_1, professional_2]

users = []
professional_container.each do |professional|
  user = User.create(
    name:                   professional[0],
    email:                  professional[1],
    role:                   professional[2],
    password:               professional[3],
    password_confirmation:  professional[4]
  )
  users.push(user)
end


# Creating disableds
childs = ['Pablo', 'Lidia']
adults = ['Juan', 'Inma']

disableds = []
childs.each do |child|
  disabled = Disabled.create(
    name:             child,
    professional_id:  users[0].id
  )
  disableds.push(disabled)

  house_child_agenda = disabled.agendas.create(
    name: 'Estoy en casa',
    image: 'child_class_pictograms/Casa.png'
  )
  school_child_agenda = disabled.agendas.create(
    name: 'Estoy en el colegio',
    image: 'child_house_pictograms/Colegio.png'
  )

  house_child_agenda.boards.create(
    name: 'Este soy yo',
    image: 'meeting_pictograms/Hola.png'
  )
  house_child_agenda.boards.create(
    name: 'Qué puedo hacer en casa',
    image: 'child_class_pictograms/Casa.png'
  )

  school_child_agenda.boards.create(
    name: 'Este soy yo',
    image: 'meeting_pictograms/Hola.png'
  )
  school_child_agenda.boards.create(
    name: 'Que puedo hacer en el colegio',
    image: 'child_house_pictograms/Colegio.png'
  )
end

adults.each do |adult|
  disabled = Disabled.create(
    name:             adult,
    professional_id:  users[1].id
  )
  disableds.push(disabled)

  adult_house_agenda = disabled.agendas.create(
    name: 'Rutinas en casa',
    image: 'adult_house_pictograms/Casa.png'
  )

  adult_house_agenda.boards.create(
    name: 'Presentación',
    image: 'meeting_pictograms/Hola.png'
  )
  adult_house_agenda.boards.create(
    name: 'Ver la tele',
    image: 'adult_house_pictograms/Televisión.png'
  )
end


# Creating guides
disableds.each do |disabled|
  guide = User.create(
    name: FFaker::Name.first_name,
    email: FFaker::Internet.safe_email,
    role: 'guide',
    password: 'secret',
    password_confirmation: 'secret'
  )
  disabled.guide_id = guide.id
  disabled.save
end


# Filling boards with pictograms
adult_house_pictograms = ['Sí', 'Me gusta', 'No me gusta', 'No',
                          'Quiero', 'Ver la tele', 'Subir volumen','Bajar volumen',
                          'Telediario', 'Película', 'Documental', 'Concurso',
                          'Deportes', 'Dibujos animados', 'Encender la tele', 'Apagar la tele',
                          'Contento', 'Aburrido', 'Triste', 'Enfadado']

child_house_pictograms = ['Sí', 'Yo', 'Mamá', 'No',
                          'Abuelos', 'Papá', 'Hermana', 'Jugar',
                          'Contento', 'Aburrido', 'Cansado', 'Enfadado',
                          'Triste', 'Cuento', 'Música', 'Ordenador',
                          'Beber', 'Comer', 'Baño', 'Dormir',
                          'Ir', 'Calle', 'Centro comercial', 'Parque']

child_class_pictograms = ['Sí', 'Yo', 'Profesora', 'No',
                          'Contento', 'Enfadado', 'Triste', 'Amigos',
                          'Clase', 'Música', 'Logopeda', 'Ordenador',
                          'Baño', 'Patio', 'Casa', 'Autobús',
                          'Beber', 'Comer', 'Quiero', 'Ir']

meeting_pictograms =     ['Sí', 'Hola', 'Adiós', 'No',
                          'Yo', 'Mamá', 'Papá', 'Hermana']

boards = Board.all
boards.each do |board|
  container = case board.name
    when 'Este soy yo' then meeting_pictograms
    when 'Presentación' then meeting_pictograms
    when 'Qué puedo hacer en casa' then child_house_pictograms
    when 'Que puedo hacer en el colegio' then child_class_pictograms
    when 'Ver la tele' then adult_house_pictograms
  end
  path = case board.name
    when 'Este soy yo' then 'meeting_pictograms'
    when 'Presentación' then 'meeting_pictograms'
    when 'Qué puedo hacer en casa' then 'child_house_pictograms'
    when 'Que puedo hacer en el colegio' then 'child_class_pictograms'
    when 'Ver la tele' then 'adult_house_pictograms'
  end

  container.each do |image|
    pictogram = Pictogram.create(
      name:  image,
      image: path + '/' + image.to_s + '.png'
    )
    board.pictograms << pictogram
  end
end
