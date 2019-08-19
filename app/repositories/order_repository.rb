require 'active_support/concern'

module OrderRepository
  extend ActiveSupport::Concern

  included do
    scope :actual, -> {where(aasm_state: :actual) }
  end
end