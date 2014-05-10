class UsersController < ApplicationController
  def index
    @users = []
    user_names = ['vincent', 'radu', 'seren', 'tom', 'dan', 'barrie', 'ad']
    user_names.each_with_index do |user, i|
      @users << {
        name: user,
        image: ActionController::Base.helpers.asset_path("face/#{user}.png"),
        distance: {
          amount: [*4..20].sample,
          unit: "KM"
        }
      }
    end
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @users }
    end
  end
end
