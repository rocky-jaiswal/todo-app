FactoryGirl.define do
  factory :user1, class: User do
    name "John Doe"
    email "jd@example.com"
    password "12345678"
    password_confirmation "12345678"
  end
end
