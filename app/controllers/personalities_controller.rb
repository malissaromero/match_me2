class PersonalitiesController < ApplicationController

  def index
    @personalities = Personality.all
  end

  def show
    @personality = Personality.find(params[:id])
  end

  def get_from_api
    response = HTTParty.get('https://api.traitify.com/v1/assessments/d42bb058-ee15-4ba3-b816-fc5f438ae680/slides')
    puts response.body, response.code, response.message, response.headers.inspect
  end

  private
  def personality_params
    params.require(:personality).permit(:personality_id, :traits_score, :types_score)
  end
end
