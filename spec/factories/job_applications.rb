FactoryBot.define do
  factory :job_application do
    person
    job_opportunity
  end
end