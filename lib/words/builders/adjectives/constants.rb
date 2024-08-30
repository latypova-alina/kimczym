module Words
  module Builders
    module Adjectives
      module Constants
        CLASSIC_DEGREE_ORDER = %w[pos com sup].freeze
        CLASSIC_CASES_ORDER = %w[nom gen dat acc inst loc voc].freeze
        CLASSIC_GENDER_ORDER = %w[m1 m2 m3 f n].freeze
        CLASSIC_NUMBERS_ORDER = %w[sg pl].freeze

        GENDER_TRANSLATION_KEYS = {
          "sg" => {
            "m1" => "m1_m2_m3",
            "m2" => "m1_m2_m3",
            "m3" => "m1_m2_m3",
            "f" => "f",
            "n" => "n"
          },
          "pl" => {
            "m1" => "m1",
            "m2" => "m2_m3_f_n",
            "m3" => "m2_m3_f_n",
            "f" => "m2_m3_f_n",
            "n" => "m2_m3_f_n"
          }
        }.freeze

        BUTTON_GENDER = {
          "m1" => "m1",
          "m2" => "m1",
          "m3" => "m1",
          "f" => "f",
          "n" => "n"
        }

        BUTTON_KEYS_MATCHERS = {
          "number" => "pl|sg",
          "gender" => "m1|m2|m3|f|n",
          "degree" => "pos|com|sup"
        }.freeze

        NAME = "adj"

        DEFAULT_BUTTON_KEY = "sg.m1.pos".freeze

        BUTTONS = {
          "sg.m1.pos" => {
            "number" => ["pl.m1.pos"],
            "gender" => ["sg.f.pos", "sg.n.pos"],
            "degree" => ["sg.m1.com", "sg.m1.sup"]
          },
          "pl.m1.pos" => {
            "number" => ["sg.m1.pos"],
            "gender" => ["pl.f.pos", "pl.n.pos"],
            "degree" => ["pl.m1.com", "pl.m1.sup"]
          },
          "sg.f.pos" => {
            "number" => ["pl.f.pos"],
            "gender" => ["sg.m1.pos", "sg.n.pos"],
            "degree" => ["sg.f.com", "sg.f.sup"]
          },
          "sg.n.pos" => {
            "number" => ["pl.n.pos"],
            "gender" => ["sg.m1.pos", "sg.f.pos"],
            "degree" => ["sg.n.com", "sg.n.sup"]
          },
          "pl.f.pos" => {
            "number" => ["sg.f.pos"],
            "gender" => ["pl.m1.pos", "pl.n.pos"],
            "degree" => ["pl.f.com", "pl.f.sup"]
          },
          "pl.n.pos" => {
            "number" => ["sg.n.pos"],
            "gender" => ["pl.m1.pos", "pl.f.pos"],
            "degree" => ["pl.n.com", "pl.n.sup"]
          },
          "sg.m1.com" => {
            "number" => ["pl.m1.com"],
            "gender" => ["sg.f.com", "sg.n.com"],
            "degree" => ["sg.m1.pos", "sg.m1.sup"]
          },
          "pl.m1.com" => {
            "number" => ["sg.m1.com"],
            "gender" => ["pl.f.com", "pl.n.com"],
            "degree" => ["pl.m1.pos", "pl.m1.sup"]
          },
          "sg.f.com" => {
            "number" => ["pl.f.com"],
            "gender" => ["sg.m1.com", "sg.n.com"],
            "degree" => ["sg.f.pos", "sg.f.sup"]
          },
          "sg.n.com" => {
            "number" => ["pl.n.com"],
            "gender" => ["sg.m1.com", "sg.f.com"],
            "degree" => ["sg.n.pos", "sg.n.sup"]
          },
          "pl.f.com" => {
            "number" => ["sg.f.com"],
            "gender" => ["pl.m1.com", "pl.n.com"],
            "degree" => ["pl.f.pos", "pl.f.sup"]
          },
          "pl.n.com" => {
            "number" => ["sg.n.com"],
            "gender" => ["pl.m1.com", "pl.f.com"],
            "degree" => ["pl.n.pos", "pl.n.sup"]
          },
          "sg.m1.sup" => {
            "number" => ["pl.m1.sup"],
            "gender" => ["sg.f.sup", "sg.n.sup"],
            "degree" => ["sg.m1.pos", "sg.m1.com"]
          },
          "pl.m1.sup" => {
            "number" => ["sg.m1.sup"],
            "gender" => ["pl.f.sup", "pl.n.sup"],
            "degree" => ["pl.m1.pos", "pl.m1.com"]
          },
          "sg.f.sup" => {
            "number" => ["pl.f.sup"],
            "gender" => ["sg.m1.sup", "sg.n.sup"],
            "degree" => ["sg.f.pos", "sg.f.com"]
          },
          "sg.n.sup" => {
            "number" => ["pl.n.sup"],
            "gender" => ["sg.m1.sup", "sg.f.sup"],
            "degree" => ["sg.n.pos", "sg.n.com"]
          },
          "pl.f.sup" => {
            "number" => ["sg.f.sup"],
            "gender" => ["pl.m1.sup", "pl.n.sup"],
            "degree" => ["pl.f.pos", "pl.f.com"]
          },
          "pl.n.sup" => {
            "number" => ["sg.n.sup"],
            "gender" => ["pl.m1.sup", "pl.f.sup"],
            "degree" => ["pl.n.pos", "pl.n.com"]
          }
        }.freeze
      end
    end
  end
end
