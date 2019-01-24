class PropertysController < ApplicationController
  before_action:checkSession, only: [ :new, :edit, :show, :destroy, :list, :googlema,:popular_list, :confirm]
  before_action:user_have_current, only: [:list, :show]
  
  #count++
  impressionist actions: [:show]
  #, unique: [:ip_address]

  def index
  end
  
  def googlemap
    render :layout => false
  end
  
  def popular_list
    @propertys = Property.order('impressions_count DESC').take(3)
    #impressionist_count
    p @propertys
  end

  def new
    if params[:back]
      @propertys = Property.new(property_params)
    else
      @propertys = Property.new
    end
  end
  
  def confirm
    @propertys = Property.new(property_params)
    #@property.video = params[:property][:video]
    p @propertys
  end
  
  def create
    @propertys = Property.new(property_params)
    @propertys.user_id = current_user.id
    p @propertys
    if params[:property][:video] != nil
      @propertys.video = Rails.root.join("public/#{params[:property][:video]}").open
    end
    p @propertys.video
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
    @q = Property.ransack(params[:q])
    @propertys = Property.all
    p @propertys
  end
  
  def show
    @propertys = Property.find(params[:id])
    #@user = User.find(current_user.id)
    @favorite = current_user.favorites.find_by(property_id: @propertys.id)
    
    
    p @favorite
  end
  
  def destroy
    @propertys = Property.find(params[:id])
    @propertys.destroy
    redirect_to list_propertys_path
  end
  
  def edit
    @propertys = Property.find(params[:id])
    p @propertys 
  end
  
  def update
    @propertys = Property.find(params[:id])
    if params[:property][:video] != nil
      @propertys.video = Rails.root.join("public/#{params[:property][:video]}").open
    end
    p @propertys
    @propertys.update(property_params)
    redirect_to list_propertys_path
  end
  

  private
  
  def property_params
    params.require(:property).permit({image: []}, :video, :image_cache, :name, :rent, :subsidy, :reward, :region, :area, :extent, :longitude, :latitude)
  end
  

end