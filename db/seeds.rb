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
disableds_container = [childs, adults]

disableds = []
childs.each do |child|
  disabled = Disabled.create(
    name:             child,
    professional_id:  users[0].id
  )
  disableds.push(disabled)

  house_child_agenda = disabled.agendas.create(
    name: 'Estoy en casa',
    image: 'child_class_pictograms/casa_1.png'
  )
  school_child_agenda = disabled.agendas.create(
    name: 'Estoy en el colegio',
    image: 'child_house_pictograms/colegio.png'
  )

  house_child_agenda.boards.create(
    name: 'Este soy yo',
    image: 'meeting_pictograms/hola.png'
  )
  house_child_agenda.boards.create(
    name: 'Qué puedo hacer en casa',
    image: 'child_class_pictograms/casa_1.png'
  )

  school_child_agenda.boards.create(
    name: 'Este soy yo',
    image: 'meeting_pictograms/hola.png'
  )
  school_child_agenda.boards.create(
    name: 'Que puedo hacer en el colegio',
    image: 'child_house_pictograms/colegio.png'
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
    image: 'adult_house_pictograms/casa.png'
  )

  adult_house_agenda.boards.create(
    name: 'Presentación',
    image: 'meeting_pictograms/hola.png'
  )
  adult_house_agenda.boards.create(
    name: 'Ver la tele',
    image: 'adult_house_pictograms/televisión.png'
  )
end

# disableds_container.each do |disabled_type|
#   users.each do |professional|
#     disabled_type.each do |person|
#       disabled = Disabled.create(
#         name:             person,
#         professional_id:  professional.id
#       )
#       disableds.push(disabled)
#
#       # Creating agendas & boards
#       if disabled_type == childs
#         house_child_agenda = disabled.agendas.create(
#           name: 'Estoy en casa',
#           image: 'child_class_pictograms/casa_1.png'
#         )
#         school_child_agenda = disabled.agendas.create(
#           name: 'Estoy en el colegio',
#           image: 'child_house_pictograms/colegio.png'
#         )
#
#         house_child_agenda.boards.create(
#           name: 'Este soy yo',
#           image: 'meeting_pictograms/hola.png'
#         )
#         house_child_agenda.boards.create(
#           name: 'Qué puedo hacer en casa',
#           image: 'child_class_pictograms/casa_1.png'
#         )
#
#         school_child_agenda.boards.create(
#           name: 'Este soy yo',
#           image: 'meeting_pictograms/hola.png'
#         )
#         school_child_agenda.boards.create(
#           name: 'Que puedo hacer en el colegio',
#           image: 'child_house_pictograms/colegio.png'
#         )
#       else
#         adult_house_agenda = disabled.agendas.create(
#           name: 'Rutinas en casa',
#           image: 'adult_house_pictograms/casa.png'
#         )
#
#         adult_house_agenda.boards.create(
#           name: 'Presentación',
#           image: 'meeting_pictograms/hola.png'
#         )
#         adult_house_agenda.boards.create(
#           name: 'Ver la tele',
#           image: 'adult_house_pictograms/televisión.png'
#         )
#       end
#     end
#   end
# end


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
end


# Filling boards with pictograms
adult_house_pictograms = ['casa', 'televisión']
child_house_pictograms = ['abuelos', 'aburrido', 'baño', 'beber', 'calle',
  'cansado', 'centro_comercial', 'colegio', 'comer_2', 'contento_1', 'cuento',
  'dormir_1', 'enfadado', 'hermana', 'ir', 'jugar', 'mamá', 'música_1', 'no_1',
  'ordenador_1', 'papá', 'parque', 'primo', 'sí_1', 'triste_1', 'yo']
child_class_pictograms = ['amigos', 'autobús', 'baño', 'beber', 'casa_1',
  'clase_6', 'comer_2', 'contento_1', 'enfadado', 'ir', 'logopeda', 'música_1',
  'no_1', 'ordenador_1', 'patio', 'profesora', 'querer', 'sí_1' ,'triste_1',
  'yo']
meeting_pictograms = ['adiós', 'colegio', 'hermana', 'hola', 'mamá', 'no_1',
  'papá', 'sí_1', 'yo']


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
  if !container
    binding.pry
  end
  container.each do |image|
    pictogram = Pictogram.create(
      name:  image,
      image: path + '/' + image.to_s + '.png'
    )
    board.pictograms << pictogram
  end
end
