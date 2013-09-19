
FactoryGirl.define do
  factory :template, :class => Refinery::Widgets::Template do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

