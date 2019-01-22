class BoardsController < ApplicationController
  before_action:checkSession
  before_action:user_have_current, only: [:index, :write_noticeboards, :write_questionboard, :question_show, :edit]
  
  def index
    puts("부동산 noticeboards 진입")
    #@user = User.find(current_user.id)
    @noticeboards = Noticeboard.all
    @questionboard = Questionboard.all
  end
  
  def write_noticeboards
    puts("write_noticeboards 진입")
    @noticeboards = Noticeboard.new
  end
  
  def write_questionboard
    puts(" write_questionboard 진입")
    #@user = User.find(current_user.id)
    @questionboard = Questionboard.new
  end
  
  def create_notice
    puts("create_notice 진입")
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
    puts("create_question진입")
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
  
  def edit 
    @noticeboards = Noticeboard.find(params[:id])
  end
  
  def notice_update
    p params[:noticeboard][:id]
    @noticeboards = Noticeboard.find(params[:noticeboard][:id])
    if @noticeboards.update(notice_params)
      redirect_to boards_path
    else
      redirect_to boards_path
    end 
  end
  
  def question_update
    p params[:questionboard][:id]
    @questionboard = Questionboard.find(params[:questionboard][:id])
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
    @noticeboard = Noticeboard.find(params[:id])
    p @noticeboard
    @noticeboard.destroy
    redirect_to boards_path
  end
  
  def destroy_questionboard
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
