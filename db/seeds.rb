# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  { id: 1, recommend_time: Time.parse("7:00"), period: :morning },
  { id: 2, recommend_time: Time.parse("12:00"), period: :daytime },
  { id: 3, recommend_time: Time.parse("19:00"), period: :night },
].each do |params|
  MRecommendedNewsTime.find_or_initialize_by(id: params[:id]).update!(params)
end

[
  { id: 1, name: "コロナ", code: "COVID-19", default_delivery_time: Time.parse("08:00") },
  { id: 2, name: "熱中症", code: "heartstroke", default_delivery_time: Time.parse("08:00") },
  { id: 3, name: "健康/運動", code: "exercise", default_delivery_time: Time.parse("08:00") },
  { id: 4, name: "ライフハック", code: "lifehack", default_delivery_time: Time.parse("08:00") },
  { id: 5, name: "メンタルヘルス", code: "mental", default_delivery_time: Time.parse("08:00") },
  { id: 6, name: "食事", code: "meal", default_delivery_time: Time.parse("08:00") },
  { id: 7, name: "睡眠", code: "sleep", default_delivery_time: Time.parse("08:00") },
].each do |params|
  Topic.find_or_initialize_by(id: params[:id]).update!(params)
end
