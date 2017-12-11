# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# add User
root_user = User.new(name: "ROOT USER", username: "root", email: "root@root.com", root: true)
root_user.password = "root"
root_user.password_confirmation = "root"
root_user.save!

test_user = User.new(name: "テストユーザー", username: "test", email: "test@test.com", root: false)
test_user.password = "test"
test_user.password_confirmation = "test"
test_user.save!

kurotaku = User.new(name: "黒岩 拓", username: "kurotaku", email: "kurotaku@qulazy.com", root: false)
kurotaku.password = "kurotaku"
kurotaku.password_confirmation = "kurotaku"
kurotaku.save!

yamada = User.new(name: "山田 太郎", username: "yamada", email: "yamada@qulazy.com", root: false)
yamada.password = "yamada"
yamada.password_confirmation = "yamada"
yamada.save!

saito = User.new(name: "斎藤 一", username: "saito", email: "saito@qulazy.com", root: false)
saito.password = "saito"
saito.password_confirmation = "saito"
saito.save!

steave = User.new(name: "スティーブ・ジョブズ", username: "steave", email: "steave@apple.com", root: false)
steave.password = "apple"
steave.password_confirmation = "apple"
steave.save!

ichiro = User.new(name: "鈴木 一郎", username: "ichiro", email: "ichiro@qulazy.com", root: false)
ichiro.password = "ichiro"
ichiro.password_confirmation = "ichiro"
ichiro.save!

# add Post
kurotaku.posts.create(title: "", fact: "", opinion: "")
kurotaku.posts.create(title: "池袋駅の喫煙所は", fact: "西口公園にある", opinion: "誰でも使っていいと思う")
kurotaku.posts.create(title: "東京タワーの高さ", fact: "333m", opinion: "")
kurotaku.posts.create(title: "東京スカイツリーの高さ", fact: "634m", opinion: "ムサシと覚えるといい")
kurotaku.posts.create(title: "新宿駅から東京駅までの乗り換え", fact: "JR8番線ホーム中央線快速に乗る", opinion: "")

yamada.posts.create(title: "東京タワーの高さ", fact: "333m", opinion: "")
yamada.posts.create(title: "東京スカイツリーの高さ", fact: "634m", opinion: "")

saito.posts.create(title: "東京ドームの面積", fact: "0.047 km²", opinion: "")

steave.posts.create(title: "東京タワーができた年", fact: "1958年（昭和33年）12月23日", opinion: "")
steave.posts.create(title: "東京タワーの最寄駅", fact: "・都営大江戸線赤羽橋駅：徒歩5分\n・日比谷線神谷町駅：徒歩7分\n・都営三田線御成門駅：徒歩6分\n・都営大江戸線、浅草線大門駅：徒歩10分\n・JR浜松町駅：徒歩15分", opinion: "")



#add Judge
kurotaku.good(Post.find_by(title: "池袋駅の喫煙所は"))
yamada.good(Post.find_by(title: "東京タワーの高さ"))
saito.good(Post.find_by(title: "東京タワーの高さ"))
steave.good(Post.find_by(title: "東京タワーの高さ"))
ichiro.bad(Post.find_by(title: "東京タワーの高さ"))

kurotaku.good(Post.find_by(title: "東京ドームの面積"))