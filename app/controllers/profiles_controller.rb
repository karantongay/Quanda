class ProfilesController < ApplicationController

def index
	@question = Question.where(askedby: current_user.email)
	@followers = current_user.followers
	@answer = Answer.where(answeredby: current_user.email)
	#@questiont = Question.where(title: @question.title)
end
def create

	@profile = Profile.new(profile_params)
  		if @question.save
  			redirect_to @profile
  		else
  			render 'new'
  		end

end

private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name)
    end

end