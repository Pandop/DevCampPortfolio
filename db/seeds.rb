# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do |topic|
  Topic.create(
    title: "Topic #{topic} "
  )
end
puts "3 Topics created."

10.times do |blog|
  Blog.create!(
    title: " My Blog Post #{blog}",
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore a fugiat recusandae quas nam provident, officia cumque autem voluptatibus quis modi iusto similique.",
    topic_id: Topic.last.id
  )
end
puts "10 blog posts created."

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_completed: 15
  )
end
puts "5 skill posts created."

8.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.  Labore a fugiat recusandae quas nam provident, officia cumque autem voluptatibus quis modi iusto similique. Eaque perspiciatis, asperiores possimus aperiam mollitia accusantium? 
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore a fugiat recusandae quas nam provident, officia cumque autem voluptatibus quis modi iusto similique. Eaque perspiciatis, asperiores possimus aperiam mollitia accusantium?",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200"
  )
end

1.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Angular",
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit.  Labore a fugiat recusandae quas nam provident, officia cumque autem voluptatibus quis modi iusto similique. Eaque perspiciatis, asperiores possimus aperiam mollitia accusantium? 
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore a fugiat recusandae quas nam provident, officia cumque autem voluptatibus quis modi iusto similique. Eaque perspiciatis, asperiores possimus aperiam mollitia accusantium?",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/350x200"
  )
end

puts "9 portfolio posts created."