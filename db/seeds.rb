require 'faker'
UserTicket.delete_all
Ticket.delete_all
Movie.delete_all
MovieTheater.delete_all
User.delete_all

# Tạo dữ liệu giả cho bảng "movie_theaters"
5.times do
  MovieTheater.create(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    province: Faker::Address.state
  )
end

# Tạo dữ liệu giả cho bảng "movies"
MovieTheater.all.each do |movie_theater|
  10.times do
    movie = Movie.create(
      name: Faker::Movie.title,
      director: Faker::Name.name,
      actors: Faker::Name.name,
      description: Faker::Lorem.paragraph,
      country: Faker::Address.country,
      genre: Faker::Book.genre,
      releaseDate: Faker::Date.between(from: 10.years.ago, to: Date.today),
      movie_theater_id: movie_theater.id # Sử dụng id của movie_theater
    )

    image_file = Faker::LoremFlickr.image(size: "300x400")
    movie.image.attach(io: URI.open(image_file), filename: 'movie_image.png')
  end
end

# Tạo dữ liệu giả cho bảng "tickets" liên quan đến movie
Movie.all.each do |movie|
  2.times do
    Ticket.create(
      seat: Faker::Alphanumeric.alpha(number: 3),
      room: Faker::Number.between(from: 1, to: 10),
      price: Faker::Number.decimal(l_digits: 3, r_digits: 2),
      showtime: Faker::Time.between(from: 1.month.ago, to: 1.month.from_now),
      status: ["available", "reserved", "sold"].sample,
      movie_id: movie.id,
      movie_theater_id: movie.movie_theater_id
    )
  end
end

# Tạo dữ liệu giả cho bảng "users"
10.times do |index|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "phuonganh+#{index}@gmail.com",
    role: ["admin", "user"].sample,
    password: 'password'
  )
end

# Tạo dữ liệu giả cho bảng "user_tickets" bằng cách tương ứng user và ticket
User.all.each do |user|
  2.times do
    UserTicket.create(
      user_id: user.id,
      ticket_id: Ticket.where(status: "available").sample.id
    )
  end
end
