class Web::Admin::ApplicationController < Web::ApplicationController
    before_action :authenticate_user!
end
