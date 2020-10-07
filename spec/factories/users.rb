FactoryBot.define do
  factory :user do
    nickname { 'あああ' }
    family_name { '山田' }
    first_name { '太郎' }
    family_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { '1990-1-1' }
    email { 'sample@gmail.com' }
    password { 'ccc111' }
    password_confirmation { password }
  end
end
