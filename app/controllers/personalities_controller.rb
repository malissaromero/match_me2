class PersonalitiesController < ApplicationController

  def index
    @personalities = Personality.all
  end

  def show
    @personality = Personality.find(params[:id])
  end

  def get_from_api
    response = HTTParty.get('https://api.traitify.com/v1/assessments/{assessment_id}/slides')
    puts response.body, response.code, response.message, response.headers.inspect
  end

  private
  def personality_params
    params.require(:personality).permit(:personality_id, :traits_score, :types_score)
  end
end
