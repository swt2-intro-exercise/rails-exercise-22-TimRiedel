FactoryBot.define do
  factory :author do
    first_name { "Alan" }
    last_name { "Turing" }
    homepage { "http://wikipedia.de/Alan_Turing" }

    trait :second_author do
      first_name { "Peter" }
      last_name { "Plagiarist" }
      homepage { "https://thispagedoesnotexist.com" }
    end
  end

  
end
