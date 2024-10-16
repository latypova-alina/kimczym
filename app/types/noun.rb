require "active_model"

class Noun
  include ActiveModel::Validations
  include ::Caseable
  include ::Numberable

  attr_accessor :key_name

  def initialize(number:, key_name: nil)
    @number = number
    @key_name = key_name
  end
end
