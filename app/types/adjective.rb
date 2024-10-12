require "active_model"

class Adjective
  include ActiveModel::Validations
  include ::Caseable

  VALID_NUMBERS = %w[sg pl].freeze
  VALID_GENDERS = %w[m1 m2 m3 f n].freeze
  VALID_DEGREES = %w[pos com sup].freeze

  attr_accessor :number, :gender, :degree, :key_name

  validates :number, inclusion: { in: VALID_NUMBERS, message: "%<value>s is not a valid number" }
  validates :gender, inclusion: { in: VALID_GENDERS, message: "%<value>s is not a valid gender" }
  validates :degree, inclusion: { in: VALID_DEGREES, message: "%<value>s is not a valid degree" }

  def initialize(number:, gender:, degree:, key_name: nil)
    @number = number
    @gender = gender
    @degree = degree
    @key_name = key_name
  end
end
