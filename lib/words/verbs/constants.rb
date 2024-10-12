module Words
  module Verbs
    module Constants
      FINITE_NAME = "fin".freeze
      NAME = "verb".freeze

      CLASSIC_NUMBERS_ORDER = %w[sg pl].freeze
      CLASSIC_PERSON_ORDER = %w[pri sec ter].freeze
      BUTTONS_CATEGORIES = %w[verb_form].freeze
      POSSIBLE_VERB_FORMS = %w[fin praet cond impt].freeze

      BUTTONS = {
        "fin" => {
          "verb_form" => %w[praet cond impt]
        },
        "praet" => {
          "verb_form" => %w[fin cond impt]
        },
        "cond" => {
          "verb_form" => %w[fin praet impt]
        },
        "impt" => {
          "verb_form" => %w[fin praet cond]
        }
      }.freeze

      FIN_JOIN_CONTENTS = {
        "sg" => %w[sg pl]
      }.freeze

      BUTTON_KEYS_MATCHERS = {
        "verb_form" => "fin|praet|cond|impt"
      }.freeze
    end
  end
end
