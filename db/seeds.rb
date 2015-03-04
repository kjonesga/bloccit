 require 'faker'
 
 # Create Posts
 1.times do
   Post.create!(
     
     #title:  Faker::Lorem.sentence,
     title:  "This just an advertisement for Bloc!!!",
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all



 # Create Comments
 1.times do
   Comment.create!(
     post: posts.sample,
     #body: Faker::Lorem.paragraph
     body: "The Unique comment goes here!!!!"
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"