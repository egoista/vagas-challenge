FactoryBot.define do
  factory :location do
    name { ('A'..'Z').to_a.sample }
  end
end