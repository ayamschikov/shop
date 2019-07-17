require 'uri'

class User < ApplicationRecord
    validates :name, :surname, presence: true, length: { minimum: 2 }
    validates :email, presence:true, format: { with: URI::MailTo::EMAIL_REGEXP }
    
    extend Enumerize
    enumerize :role, in: [:admin, :client], default: :client
end
