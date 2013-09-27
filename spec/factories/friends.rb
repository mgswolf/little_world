FactoryGirl.define do
  factory :friend do
    sequence(:name) { |n| "Friend #{n}" }
    latitude Random.new.rand(-99.0..99.0)
    longitude Random.new.rand(-99.0..99.0)
  end

end