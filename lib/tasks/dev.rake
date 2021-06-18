task sample_data: :environment do
  starting = Time.now


  Comment.delete_all
  Post.delete_all
  User.delete_all

  5.times do
     
    name = Faker::Name.first_name.downcase
    User.create(
      email: "#{name}@example.com",
      password: "password",
      username: name,
    )
  end


  5.times do
     
    name = Faker::Name.first_name.downcase
    User.create(
      email: "#{name}@example.com",
      password: "password",
      username: name,
    )
  end

  
  User.create(
    email: "alice@example.com",
    password: "password",
    username: "alice",
  )


  10.times do 
    body1 = Faker::Movies::Lebowski.quote
    title1 = Faker::Movies::Lebowski.character

    Post.create(
      title: title1,
      body: body1,
    )
  end 

  posts = Post.all
  users = User.all

  posts.each do |p|
    users.each do |u|
      body2 = Faker::TvShows::RickAndMorty.quote
      if rand > 0.75
        Comment.create(
          body: body2,
          post: p,
          owner: u
        )
      end
    end
  end 
  
  

  10.times do
    
    comments = Comment.all
    body3 = Faker::TvShows::RickAndMorty.quote

    Comment.create(
      body: body3,
      owner: users.sample,
      parent: comments.sample
    )

  end

  ending = Time.now
  p "It took #{(ending - starting).to_i} seconds to create sample data."
  p "There are now #{User.count} users."
  p "There are now #{Comment.count} comments."

  p "There are now #{Post.count} posts."
end