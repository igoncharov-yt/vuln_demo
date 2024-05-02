# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Template.find_or_initialize_by(kind: "receipt").update(html: File.open(Rails.root.join("app/views/default_templates", "receipt.html")).read.strip)