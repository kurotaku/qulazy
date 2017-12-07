# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザー登録
root_user = User.new(name: 'root user', username: 'root', email: 'root@root.com', root: true)
root_user.password = 'root'
root_user.password_confirmation = 'root'
root_user.save!

test_user = User.new(name: 'テストユーザー', username: 'test', email: 'test@test.com', root: false)
test_user.password = 'test'
test_user.password_confirmation = 'test'
test_user.save!

kurotaku = User.new(name: '黒岩 拓', username: 'kurotaku', email: 'kurotaku@qulazy.com', root: false)
kurotaku.password = 'kurotaku'
kurotaku.password_confirmation = 'kurotaku'
kurotaku.save!

yamada = User.new(name: '山田 太郎', username: 'yamada', email: 'yamada@qulazy.com', root: false)
yamada.password = 'yamada'
yamada.password_confirmation = 'yamada'
yamada.save!

saito = User.new(name: '斎藤 一', username: 'saito', email: 'saito@qulazy.com', root: false)
saito.password = 'saito'
saito.password_confirmation = 'saito'
saito.save!

kurotaku.posts.create(title: '', fact: '', opinion: '')
kurotaku.posts.create(title: '池袋駅の喫煙所は', fact: '西口公園にある', opinion: '誰でも使っていいと思う')
kurotaku.posts.create(title: '東京タワーの高さ', fact: '333m', opinion: '')
kurotaku.posts.create(title: '東京スカイツリーの高さ', fact: '634m', opinion: 'ムサシと覚えるといい')
kurotaku.posts.create(title: '新宿駅から東京駅までの乗り換え', fact: 'JR8番線ホーム中央線快速に乗る', opinion: '')

yamada.posts.create(title: '東京タワーの高さ', fact: '333m', opinion: '')
yamada.posts.create(title: '東京スカイツリーの高さ', fact: '634m', opinion: '')