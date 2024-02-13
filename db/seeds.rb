# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Airport.destroy_all
Airport.create!([{
  airport_code: "DLH"
},
{
  airport_code: "MUM"
},
{
  airport_code: "BAG"
},
{
  airport_code: "CHE"
},
{
  airport_code: "KOL"
},
{
  airport_code: "CHA"
},
{
  airport_code: "BHO"
}])
p "Created #{Airport.count} Airport"