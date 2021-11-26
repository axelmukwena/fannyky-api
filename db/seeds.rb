# require 'faker'
# require 'pathname'
#
# # User.delete_all
# Painting.delete_all
#
# # 10.times do
# #  User.create(email: Faker::Internet.unique.email,
# #              password: "password")
# # end
#
# $image_paths = Array['paintings/pexels-steve-johnson-1269968.jpg', 'paintings/pexels-anni-roenkae-4175054.jpg',
#                     'paintings/pexels-alexander-ant-7031674.jpg', 'paintings/pexels-pixabay-159862.jpg',
#                     'paintings/pexels-sharon-mccutcheon-1149019.jpg', 'paintings/pexels-anni-roenkae-3418400.jpg',
#                     'paintings/pexels-dids-3029545.jpg', 'paintings/pexels-anni-roenkae-2860804.jpg',
#                     'paintings/pexels-dan-cristian-pădureț-1193743.jpg', 'paintings/pexels-suzy-hazelwood-1762973.jpg',
#                     'paintings/pexels-suzy-hazelwood-1762973 (1).jpg', 'paintings/pexels-steve-johnson-1058367.jpg',
#                     'paintings/pexels-junghua-liu-3063362.jpg', 'paintings/pexels-steve-johnson-1585325.jpg',
#                     'paintings/pexels-steve-johnson-1789968.jpg', 'paintings/pexels-sergio-souza-1998479.jpg',
#                     'paintings/pexels-jot-2179483.jpg', 'paintings/pexels-fiona-art-3631430.jpg',
#                     'paintings/pexels-luis-quintero-3101527.jpg', 'paintings/pexels-steve-johnson-1509534.jpg',
#                     'paintings/pexels-alexander-ant-7004697.jpg', 'paintings/pexels-steve-johnson-1416367.jpg',
#                     'paintings/pexels-steve-johnson-1690351.jpg', 'paintings/pexels-steve-johnson-1570779.jpg',
#                     'paintings/pexels-tim-gouw-139764.jpg', 'paintings/pexels-steve-johnson-1704120.jpg',
#                     'paintings/pexels-nick-collins-1293120.jpg', 'paintings/pexels-steve-johnson-1572386.jpg',
#                     'paintings/pexels-steve-johnson-1418595.jpg', 'paintings/pexels-dids-2911521.jpg',
#                     'paintings/pexels-david-waschbüsch-1887946.jpg', 'paintings/pexels-nick-collins-1292998.jpg',
#                     'paintings/pexels-reafon-gates-1570264.jpg', 'paintings/pexels-damir-mijailovic-3651579.jpg',
#                     'paintings/pexels-dids-2911527.jpg', 'paintings/pexels-zaksheuskaya-1546249.jpg',
#                     'paintings/pexels-max-ravier-2253900.jpg', 'paintings/pexels-nick-collins-1293006.jpg',
#                     'paintings/pexels-ron-lach-8243012.jpg', 'paintings/pexels-steve-johnson-1070534.jpg',
#                     'paintings/pexels-curioso-photography-288100.jpg', 'paintings/pexels-pixabay-164455.jpg',
#                     'paintings/pexels-steve-johnson-933967.jpg', 'paintings/pexels-valiphotos-589808.jpg',
#                     'paintings/pexels-steve-johnson-1573434.jpg', 'paintings/pexels-dids-2911545.jpg']
#
# $digits = Array(1..3)
# def get_images
#   images = Array.new
#   digit = $digits.sample # Get random number
#   digit.times do
#     images.append($image_paths.sample)
#   end
#   images
# end
#
#
# 1.times do
#   Painting.create(
#     title: Faker::Book.title,
#     description: Faker::Lorem.paragraph(sentence_count: 4),
#     user: User.order(Arel.sql('RANDOM()')).first,
#     painter: Painter.order(Arel.sql('RANDOM()')).first
#   # images: get_images
#   )
#
#   Painting.create(
#     title: "Today",
#     description: "Faker::Lorem.paragraph(sentence_count: 4)",
#     user_id: 50,
#     painter_id: 2
#   # images: get_images
#   )
# end
#
# #1.times do
# #  Painter.create(
# #    name: Faker::Book.title,
# #    about: Faker::Lorem.paragraph(sentence_count: 4),
# #    user: User.order(Arel.sql('RANDOM()')).first
# #  # images: get_images
# #    )
# #end
#
# puts Faker::Book.title
# puts Faker::Lorem.paragraph(sentence_count: 4)
# puts User.order(Arel.sql('RANDOM()')).first.id
# puts Painter.order(Arel.sql('RANDOM()')).first.id