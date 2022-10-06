# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "adrian@example.com", 
            name: "adrian", 
            role: User.roles[:admin],
            password: "password", 
            password_confirmation: "password")

User.create(email: "John@doe.com", 
            name: "John", 
            password: "password", 
            password_confirmation: "password")
posts = []
comments = []

elapsed = Benchmark.measure do
  10.times do |x|
    puts "Creating post #{x}"
    post = Post.new(title: "Title #{x}", 
                      body: "Body #{x} Words goes here Idk",
                      user_id: User.first.id)
      posts.push(post)
    2.times do |y|
      puts "Creating comment #{y} for post #{x}"
      comment = post.comments.new(body: "Comment #{y}",
                    user_id: User.second.id)
      comments.push(comment)
      end
  end
end
Post.import(posts)
Comment.import(comments)
puts "Elapsed time is #{elapsed.real} seconds."