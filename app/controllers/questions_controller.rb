class QuestionsController < ApplicationController
  before_action :set_question, only: [ :show, :edit, :update, :destroy]
   
  def index
    @questions = Question.all
  end
  
  #詳細確認
  def show
    @answer = Answer.new
  end
  
  #新規作成
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :new
    end
  end
  
  def edit

  end
  #更新
  def update
    if @question.update(question_params)
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :edit
    end
  end
  
  #削除
  def destroy
    @question.destroy
    redirect_to root_path, notice: 'Success!'
  end
  
  
  private
    #共通化処理
    def set_question
      @question = Question.find(params[:id])
    end
    #送られてきた内容を正確に絞る ストロングパラメーター
    def question_params
      params.require(:question).permit(:name, :title, :content)
    end
end
