require "active_model"

module Numberable
  extend ActiveSupport::Concern

  included do
    attr_accessor :number

    VALID_NUMBERS = %w[sg pl].freeze

    validates :number, inclusion: { in: VALID_NUMBERS, message: "%<value>s is not a valid number" }
  end
end
