require "active_model"

class Noun
  include ActiveModel::Validations
  include ::Caseable

  VALID_NUMBERS = %w[sg pl].freeze

  attr_accessor :number, :key_name

  validates :number, inclusion: { in: VALID_NUMBERS, message: "%<value>s is not a valid number" }

  def initialize(number:, key_name: nil)
    @number = number
    @key_name = key_name
  end
end
