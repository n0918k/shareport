FactoryBot.define do
  factory :portfolio do
    association :user
    name { 'あああ' }
    link { 'http//123' }
    description { 'あああああああ' }
  end
end
