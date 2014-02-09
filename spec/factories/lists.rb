FactoryGirl.define do
  factory :list1, class: List do
    name "list1"
    status "In Progress"
    tags "main"
    association :user, factory: :user1
  end
end
