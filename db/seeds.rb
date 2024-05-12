# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end




# user = User.create(name: 'Taro', email: 'yamada@taro.com', password: 'password', password_confirmation: "password")

# tackle = Tackle.create(name: "マイページタックルテスト")

# rod = Rod.create(name: "コルトスナイパーBB", year: 2021, power: 1, length: 10.0)
# reel = Reel.create(name: "ストラディック", year: 2023, gear_ratio: 3, length: 5000)
# line = Line.create(name: "シマノピットブル", kind: "pe", line_weight: 2, length: 300)
# lure = Lure.create(name: "サムライジグ", kind: "メタルジグ", lure_weight: 15, color: "赤金")



# Tackle.Rod.create(name: "コルトスナイパーBB", year: 2021, power: 1, length: 10.0)
# Tackle.Reel.create(name: "ストラディック", year: 2023, gear_ratio: 3, length: 5000)
# Tackle.Line.create(name: "シマノピットブル", kind: "pe", line_weight: 2, length: 300)
# Tackle.Lure.create(name: "サムライジグ", kind: "メタルジグ", lure_weight: 15, color: "赤金")
