# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

School.create(name: "KECSS")

XMLParser.new('seed-data1.xml').build_students_from_xml

Infraction.create(name: "Bullying or threatening behavior")
Infraction.create(name: "Inappropriate sexual behavior")
Infraction.create(name: "Vandalism")
Infraction.create(name: "Profanity")
Infraction.create(name: "Insubordination")
Infraction.create(name: "Disrupting the educational process")
