# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# users
user_list = [["cnie@gmail.com","cn0017","Can","Nie","1234567"],
    ["bobama@gmail.com","bo616","Barack","Obama","1234567"],
    ["asmish@gmail.com","as505",'Adam',"Smith","1234567"]
]

user_list.each do |email, username, first, last, password|
    User.create(email: email, username: username, first: first, last: last, password: password)
end


#recipes
recipe_list = [['Sushi','Dinner','false','false','true','true','Japanese','No','Put things on rice','rice, fish, soy sauce, wasabi','10','Easy',2],
	    ['Spaghetti','Dinner','true','true','true','true','Italian','pot','Boil spaghetti','spaghetti','20','Medium',3],
        ['Burger','Lunch','false','false','true','false','American','pan','This is a test','buns,grounded beef,cheese,tomato,lettuce','30','Hard',1],
        ['Chicken pot pie','Dinner','false','false','true','false','American','pan','This is a test','chicken,pie crust,peas,carrots','30','Hard',1]
	    #,'app/assets/images/sushi.jpg','app/assets/images/spaghetti.jpg','app/assets/images/burger.jpg','app/assets/images/chicken_pot_pie.jpg'
]


recipe_list.each do |name, type, is_vegan, is_vege, is_nutf, is_dairyf, cuisine,
    appliance, instr, ingre, time, level, user_id|
    Recipe.create( recipe_name: name, meal_type: type, vegan:is_vegan, vegetarian: is_vege, nut_free: is_nutf,
        dairy_free: is_dairyf, cuisine: cuisine, appliance: appliance, instructions: instr, ingredients: ingre,
        time_to_create: time, level: level, user_id: user_id)#, image: File.new(img_path)
end
# b = Recipe.create(recipe_name: 'testing', meal_type: 'Dessert', vegan:'true', vegetarian: 'true', nut_free: 'false',dairy_free: 'false', cuisine: 'French', appliance: 'tetsing', instructions: 'testing', ingredients: 'testing',time_to_create: '17', level: 'Medium', user_id: 2, :image => File.open("app/assets/images/spaghetti.jpg",'r'))
review_list = [[1,'It was disgusting',1,1],
    [3,'meh',2,2],
    [4,'really tasty!',2,1],
    [5,'MY FAVORITE EVER!',2,3],
    [5,'It was delicious!',3,3],
    [1,'I threw it away',4,3]
]
review_list.each do |star, text, recipe_id, user_id|
    Review.create(stars: star, text: text, recipe_id: recipe_id, user_id: user_id)
end