# frozen_string_literal: true

require 'uri'

class User < ApplicationRecord
  has_many :orders
  
  validates :name, :surname, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  extend Enumerize
  enumerize :role, in: %i[admin client], default: :client
end
