create_users = for i in 1..10 do
  user = User.create(
    email: "demo_user_#{i}@test.com",
    password: "12345678", 
    password_confirmation: "12345678"
    )
end

  admin_user = User.create(
    email: "admin@test.com",
    password: "12345678", 
    password_confirmation: "12345678",
    is_admin: true
    )