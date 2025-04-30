FactoryBot.define do
  factory :adjective do
    number { "sg" }
    gender { "m1" }
    degree { "pos" }
    key_name { "#{number}.#{gender}.#{degree}" }

    nom { "dobry" }
    gen { "dobrego" }
    dat { "dobremu" }
    acc { "dobrego" }
    inst { "dobrym" }
    loc { "dobrym" }
    voc { "dobry" }

    trait :plural do
      number { "pl" }
      nom { "dobrzy" }
      gen { "dobrych" }
      dat { "dobrym" }
      acc { "dobrych" }
      inst { "dobrymi" }
      loc { "dobrych" }
      voc { "dobrzy" }
    end

    trait :feminine do
      gender { "f" }
      nom { "dobra" }
      gen { "dobrej" }
      dat { "dobrej" }
      acc { "dobrą" }
      inst { "dobrą" }
      loc { "dobrej" }
      voc { "dobra" }
    end

    initialize_with { new(number:, gender:, degree:, key_name:) }
  end
end
