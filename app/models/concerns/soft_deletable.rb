# frozen_string_literal: true

module Concerns
  module SoftDeletable
    extend ActiveSupport::Concern

    included do
      include AASM

      aasm do
        state :actual, initial: true
        state :deleted

        event :remove do
          transitions from: :actual, to: :deleted
        end

        event :restore do
          transitions from: :deleted, to: :actual
        end
      end
    end
  end
end
