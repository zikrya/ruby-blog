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

second_post = Post.find_by(title: "Getting Started with Web Development")

if !second_post
  second_post = Post.create(
    title: "Getting Started with Web Development",
    body: "Are you interested in learning web development? This comprehensive guide will help you take your first steps into this exciting field.

Web development is a vast and rewarding field that combines creativity with technical skills. Whether you're looking to build personal projects, start a new career, or enhance your current skill set, understanding the basics of web development is incredibly valuable.

Here are some key areas you'll want to focus on when starting your journey:

• HTML - The foundation of web content
• CSS - Making your content look beautiful
• JavaScript - Adding interactivity to your websites
• Backend technologies - Understanding server-side programming
• Databases - Managing and storing data effectively
• Version Control - Tracking and managing your code

Remember, every expert was once a beginner. Take it step by step, practice regularly, and don't be afraid to make mistakes - they're valuable learning opportunities!

In future posts, we'll dive deeper into each of these topics and provide practical examples and exercises to help you learn. Stay tuned!",
  )

  # Attach the image separately after creating the post
  second_post.banner_image.attach(
    io: File.open(Rails.root.join("public/newtrain.jpg")),
    filename: "code.jpg",
    content_type: "image/jpeg"
  )
end
