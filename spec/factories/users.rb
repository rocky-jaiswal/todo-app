FactoryGirl.define do
  
  factory :user1, class: User do
    name "John Doe"
    email "john@example.com"
    password "12345678"
    password_confirmation "12345678"
    initialize_with { User.find_or_create_by(email: email) }
  end

  factory :user2, class: User do
    name "Jane Doe"
    email "jane@example.com"
    password "12345678"
    password_confirmation "12345678"
    initialize_with { User.find_or_create_by(email: email) }
  end
end
