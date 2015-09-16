class PersonalitiesController < ApplicationController

  def index
    @personalities = Personality.all
  end

  def show
    @personality = Personality.find(params[:id])
  end

  def get_from_api
    response = HTTParty.post(' https://api.traitify.com/v1/assessments'), {
    :body => [ { "deck_id" => "core" } ].to_json,
    :basic_auth => { :username => sql1it9v4lgdb1hgoppslv0mrm },
    })
    puts response.body, response.code, response.message, response.headers.inspect
  end

  private
  def personality_params
    params.require(:personality).permit(:personality_id, :traits_score, :types_score)
  end
end
