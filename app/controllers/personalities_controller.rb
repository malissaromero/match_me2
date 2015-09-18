class PersonalitiesController < ApplicationController

  def index
    @personalities = current_user.personalities
  end

  def show
    @personality = Personality.find(params[:id])
  end

  def new
    @personality = current_user.personalities.build(personality_params)
  end

  def get_from_api
    if !current_user.assessment_id
      response = HTTParty.post('https://api.traitify.com/v1/assessments', {
        :body => { "deck_id" => "core" }.to_json,
        :basic_auth => {username: "sql1it9v4lgdb1hgoppslv0mrm", password: "x"}
      })
      puts "traitify post: #{response}"
      current_user.assessment_id = response["id"]
      current_user.save
    end
  end

  # def results_from_api
  #   if !current_user.assessment_id
  #     response = HTTParty.get('https://api.traitify.com/v1/assessments/{assessment_id}',{
  #     :data => {"blend", "traits", "types"},
  #     :image_pack => {"linear"},
  #     :basic_auth => {username: "sql1it9v4lgdb1hgoppslv0mrm", password: "x"}
  #   })
  #     puts response
  #   end
  # end

  private
  def personality_params
    params.require(:personality).permit(:personality_id, :traits_score, :types_score)
  end
end
