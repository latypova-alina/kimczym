require "active_model"

module Numberable
  extend ActiveSupport::Concern

  VALID_NUMBERS = %w[sg pl].freeze

  included do
    attr_accessor :number

    validates :number, inclusion: { in: VALID_NUMBERS, message: "%<value>s is not a valid number" }
  end
end
