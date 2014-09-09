class PreferenceSetsController < ApplicationController
  def show
    @preferences = current_user.preference_set
  end

  def new
    @preferences = PreferenceSet.new
  end

  def create
    preferences = PreferenceSet.new(preference_set_params)
    preferences.user_id = current_user.id
    preferences.save
    redirect_to preference_set_path
  end

  private

  def preference_set_params
    params.require(:preference_set).permit(:distance, :bikes, :free_docks)
  end
end
