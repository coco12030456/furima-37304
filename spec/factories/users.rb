FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    name                  {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {person.last.kanji}
    first_name            {person.first.kanji}
    last_name_kana        {person.last.katakana}
    first_name_kana       {person.first.katakana}
    date_of_birth_id      {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end