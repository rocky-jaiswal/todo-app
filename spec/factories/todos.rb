FactoryGirl.define do
  factory :todo1, class: Todo do
    title "todo1"
    description "desc 1"
    priority "Medium"
    status "In Progress"
    tags "good"
    association :list, factory: :list1
  end

  factory :todo2, class: Todo do
    title "todo2"
    description "desc 2"
    priority "High"
    status "In Progress"
    tags "good"
    association :list, factory: :list2
  end
end
