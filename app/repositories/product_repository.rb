# frozen_string_literal: true

require 'active_support/concern'

module ProductRepository
  extend ActiveSupport::Concern

  included do
    scope :actual, -> { where(aasm_state: :actual) }
  end
end
