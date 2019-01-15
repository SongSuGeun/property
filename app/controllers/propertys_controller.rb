class PropertysController < ApplicationController
  before_action:checkSession, only: [:new, :edit, :show, :destroy, :list]

  #count++
  impressionist actions: [:show], unique: [:ip_address]

  
  def index
    puts("index 빼에에엠 ")
  end
  
  def googlemap
    puts("googlemap_guide 진입 빼에에엠 ")
    render :layout => false
  end
  
  def popular_list
    puts("popular_list 진입 빼에에엠 ")
    @propertys = Property.order("impressions_count DESC")
  end

  def new
    puts("부도상new 빼에에엠================================")
    if params[:back]
      @propertys = Property.new(property_params)
    else
      @propertys = Property.new
    end
  end
  
  def confirm
    puts("======= confirm　侵入=======")
    @propertys = Property.new(property_params)
    #@property.video = params[:property][:video]
    p @propertys
  end
  
  def create
    puts("======= create ========")
    @propertys = Property.new(property_params)
    @propertys.user_id = current_user.id
    p @propertys
    p params[:property][:video]
    
    @propertys.video = Rails.root.join("public/#{params[:property][:video]}").open
    
    p @propertys.video
    puts("＄＄＄＄＄＄＄＄  create save＄＄＄＄＄＄＄＄")
    #@property.video = params[:property][:video]
    if @propertys.save
      puts("good")
      redirect_to list_propertys_path
    else
      puts("bad")
      logger.debug @propertys.errors.inspect
      redirect_to new_property_path
    end
  end
  
  def list
    puts("list 빼에에엠 ")
    if current_user.present?
      @user = User.find(current_user.id)
      p @user
    end
    @propertys = Property.all
  end
  
  def show
    puts("부동산 show 진입")
    @propertys = Property.find(params[:id])
    @favorite = current_user.favorites.find_by(property_id: @propertys.id)
    
    p @favorite
  end
  
  def destroy
    puts("부동산 destroy 진입")
    @propertys = Property.find(params[:id])
    @propertys.destroy
    redirect_to list_propertys_path
  end
  
  def edit
    puts("부동산 edit 진입")
    @propertys = Property.find(params[:id])
  end
  
  def update
    puts("부동산 update 진입")
  end
  
  
  private
  
  def property_params
    params.require(:property).permit({image: []}, :video, :image_cache, :name, :rent, :subsidy, :reward, :region, :area, :extent, :longitude, :latitude)
  end
  
  def checkSession
    if !(session[:user_id])
      redirect_to new_session_path, notice:'loginしてください。'
    end 
  end
  
end