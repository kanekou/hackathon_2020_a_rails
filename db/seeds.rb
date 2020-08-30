# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
    [Time.parse("7:00"), :morning],
    [Time.parse("12:00"), :daytime],
    [Time.parse("19:00"), :night]
].each do |recommend_time, period|
  MRecommendedNewsTime.create!(recommend_time: recommend_time, period: period)
end
