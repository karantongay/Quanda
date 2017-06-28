class QuestionsController < ApplicationController
	before_action :authenticate_user!
	layout 'application'
	def new
		@question = Question.new
	end
	def edit
		@question = Question.find(params[:id])
		if @question.askedby != current_user.email
			flash[:info] = "You cannot edit the question asked by other user!"
			redirect_to(questions_path)
		end
	end
	def index
		@questions = Question.all
	end
	def show
    	@question = Question.find(params[:id])	
  	end
	def create
		@question = Question.new(question_params)
  		if @question.save
  			redirect_to @question
  		else
  			render 'new'
  		end
	end
	def update
		@question = Question.find(params[:id])
		if @question.update(question_params)
			redirect_to @question
		else
			render 'edit'
		end
	end
	def destroy
    	@question = Question.find(params[:id])
    	if @question.askedby != current_user.email
			flash[:notice] = "You cannot delete the question asked by other user!"
			redirect_to(questions_path)
		else
    		@question.destroy
	    	redirect_to questions_path
		end
  end
	def question_params
		params.require(:question).permit(:title, :contents, :askedby)
	end
end