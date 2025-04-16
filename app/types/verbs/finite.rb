require "active_model"

module Verbs
  class Finite
    include ActiveModel::Validations
    include ::Personable
    include ::Numberable

    attr_accessor :key_name

    def initialize(number:, key_name: nil)
      @number = number
      @key_name = key_name
    end
  end
end
