class BoardsController < ApplicationController
  before_action:checkSession
  before_action:user_have_current, only: [:index, :write_noticeboards, :write_questionboard, :question_show]
  
  def index
    puts("부동산 noticeboards 진입")
    #@user = User.find(current_user.id)
    @noticeboards = Noticeboard.all
    @questionboard = Questionboard.all
  end
  
  def write_noticeboards
    @user = User.find(current_user.id)
    #@noticeboards = Noticeboard.new
  end
  
  def write_questionboard
    puts("부동산 write_questionboard 진입")
    #@user = User.find(current_user.id)
    @questionboard = Questionboard.new
  end
  
  def create_notice
    puts("부동산 create 진입")
    @noticeboards = Noticeboard.new(notice_params)
    p @noticeboards
    if @noticeboards.save
      redirect_to boards_path
    else
      logger.debug @noticeboards.errors.inspect
      redirect_to boards_path
    end
  end
  
  def create_question
    puts("부동산 create 진입")
    @questionboard = Questionboard.new(question_params)
    @questionboard.user_id = current_user.id
    p @questionboard
    if @questionboard.save
      redirect_to boards_path
    else
      logger.debug @questionboard.errors.inspect
      redirect_to boards_path
    end
  end
  
  def question_show
    @questionboard = Questionboard.find(params[:id])
    #@user = User.find(current_user.id)
  end
  
  def question_update
    puts("부동산 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 진입")
    p params[:id]
    @questionboard = Questionboard.find(params[:id])
    p @questionboard
    if @questionboard.update(question_params)
      redirect_to boards_path
    else
      redirect_to boards_path
    end 
  end
  
  def questionboard
    puts("부동산 questionboard 진입")
  end
  
  def show
    @noticeboard = Noticeboard.find(params[:id])
    p @noticeboard
  end
  
  def destroy_noticeboards
    puts("부동산$$$$$$$$$$진입")
    @noticeboard = Noticeboard.find(params[:id])
    @questionboard.destroy
    redirect_to boards_path
  end
  
  def destroy_questionboard
    puts("부동산***********진입")
    @questionboard = Questionboard.find(params[:id])
    @questionboard.destroy
    redirect_to boards_path
  end
  
  private
  
  def notice_params
    params.require(:noticeboard).permit(:name, :title, :content)
  end
  
  def question_params
    params.require(:questionboard).permit(:name, :title, :content, :reply)
  end
  
end
