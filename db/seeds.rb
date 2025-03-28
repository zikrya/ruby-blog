# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_by(
  email_address: "admin@test.com",
  role: :admin
)

if !user
  user = User.create!(
    email_address: "admin@test.com",
    password: "admin123",
    role: :admin
  )
end

post = Post.find_by(title: "First Post")

if !post
  post = Post.create(
    title: "First Post",
    body: "Welcome to our blog! This is the very first post that kicks off our journey together.

In this space, we'll be sharing insights, stories, and valuable information about various topics that matter to our community. From technical deep-dives to industry trends, from best practices to innovative solutions - we're excited to create meaningful content that adds value to your day.

As we embark on this adventure, we invite you to be an active part of our community. Your thoughts, comments, and feedback will help shape the discussions and ensure we're addressing the topics that matter most to you.

Stay tuned for regular updates, and don't forget to subscribe to our newsletter to never miss a post. We have lots of exciting content planned, including:

• In-depth technical tutorials
• Industry insights and analysis
• Best practices and tips
• Community spotlights
• Project showcases
• And much more!

Thank you for being here at the beginning of this journey. Here's to many more posts and meaningful conversations ahead!",
  )

  # Attach the image separately after creating the post
  post.banner_image.attach(
    io: File.open(Rails.root.join("public/train.jpg")),
    filename: "train.jpg",
    content_type: "image/jpeg"
  )
end
