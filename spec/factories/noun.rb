FactoryBot.define do
  factory :noun do
    number { "sg" }
    key_name { "#{number}" }

    nom { "kot" }
    gen { "kota" }
    dat { "kotu" }
    acc { "kota" }
    inst { "kotem" }
    loc { "kocie" }
    voc { "kocie" }

    trait :plural do
      number { "pl" }
      nom { "koty" }
      gen { "kotów" }
      dat { "kotom" }
      acc { "koty" }
      inst { "kotami" }
      loc { "kotach" }
      voc { "koty" }
    end

    initialize_with { new(number:, key_name:) }
  end
end
