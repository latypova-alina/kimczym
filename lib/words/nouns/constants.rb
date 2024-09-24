module Words
  module Nouns
    module Constants
      NAME = "subst".freeze

      CLASSIC_CASES_ORDER = %w[nom gen dat acc inst loc voc].freeze
      CLASSIC_NUMBERS_ORDER = %w[sg pl].freeze
      BUTTONS_CATEGORIES = %w[number].freeze

      BUTTONS = {
        "sg" => {
          "number" => ["pl"]
        },
        "pl" => {
          "number" => ["sg"]
        }
      }.freeze

      BUTTON_KEYS_MATCHERS = {
        "number" => "pl|sg"
      }.freeze
    end
  end
end
