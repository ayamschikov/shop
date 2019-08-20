# frozen_string_literal: true

require 'active_support/concern'

module ProductRepository
  extend ActiveSupport::Concern

  included do
    scope :actual, -> { where(aasm_state: :actual) }
    scope :in_stock, -> { where("amount > 0 AND aasm_state = 'actual'") }
  end
end
