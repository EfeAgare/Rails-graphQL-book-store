FactoryBot.define do
  factory :author do
    sequence(:first_name) {  "John " }
    sequence(:last_name) { "Smith" }
    sequence(:date_of_birth) { 40.years.ago }
  end
end