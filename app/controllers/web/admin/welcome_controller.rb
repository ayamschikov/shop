# frozen_string_literal: true

class Web::Admin::WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index; end
end
