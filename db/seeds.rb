# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

# Create professionals
users = User.create([
  {name: 'Dani Garcia',     email: 'dani@bmv.io',  role: 'professional', password: 'secret', password_confirmation: 'secret'},
  {name: 'Ana Toscano',     email: 'ana@bmv.io',   role: 'professional', password: 'secret', password_confirmation: 'secret'},
  {name: 'Jose Toscano',    email: 'jose@bmv.io',  role: 'professional', password: 'secret', password_confirmation: 'secret'},
  {name: 'Harec Silvered',  email: 'harec@bmv.io', role: 'professional', password: 'secret', password_confirmation: 'secret'},
  {name: 'Alfonso Huescar', email: 'alfon@bmv.io', role: 'professional', password: 'secret', password_confirmation: 'secret'},
  {name: 'Alex Ugena',      email: 'alex@bmv.io',  role: 'professional', password: 'secret', password_confirmation: 'secret'}
])

# Create disableds
disableds = []
users.each do |user|
  3.times do
    disabled = Disabled.create(
      name:             FFaker::Name.first_name + " Disabled",
      professional_id:  user.id
    )
    disableds.push(disabled)
  end
end

disableds.each do |disabled|
  guide = User.create(
    name:                   FFaker::Name.first_name + " Guide",
    email:                  FFaker::Internet.safe_email,
    password:               'secret',
    password_confirmation:  'secret',
    role:                   "guide"
  )
  disabled.update(guide_id: guide.id)

  2.times do
    agenda = Agenda.create(
    name:         "Agenda " + disabled.id.to_s,
    image:        FFaker::Avatar.image,
    disabled_id:  disabled.id
    )

    2.times do |i|
      board = Board.create(
      name:       "Board " + i.to_s,
      image:      FFaker::Avatar.image,
      agenda_id:  agenda.id
      )

      6.times do |p|
        Pictogram.create(
        name:     "Pictogram " + p.to_s,
        image:    FFaker::Avatar.image,
        board_id: board.id
        )
      end
    end
  end
end
