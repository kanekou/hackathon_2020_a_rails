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

[
  { name: "コロナ", code: "COVID-19", default_delivery_time: Time.parse("08:00") },
  { name: "熱中症", code: "heartstroke", default_delivery_time: Time.parse("08:00") },
  { name: "健康/運動", code: "exercise", default_delivery_time: Time.parse("08:00") },
  { name: "ライフハック", code: "lifehack", default_delivery_time: Time.parse("08:00") },
  { name: "メンタルヘルス", code: "mental", default_delivery_time: Time.parse("08:00") },
  { name: "食事", code: "meal", default_delivery_time: Time.parse("08:00") },
  { name: "睡眠", code: "sleep", default_delivery_time: Time.parse("08:00") },
].each do |params|
  Topic.create(params)
end
