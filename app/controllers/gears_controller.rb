class GearsController < ApplicationController
    before_action :require_login

    # show ALL gear created
    def index 
        @gears = Gear.all
    end

    def new
        @gear = Gear.new
    end

    def create
        @gear = Gear.create(gear_params)
        @comment = Comment.new(gear_id: params[:gear_id])
        if @gear
            @gear.user_id = current_user.id 
            @gear.save!
            redirect_to gear_path(@gear) # gears/:id/show.html 
        else
            render :new
        end
    end

    def show
        @gear = Gear.find_by(:id => params[:id])
        @comment = Comment.new
    end

    def edit
        @gear = Gear.find(params[:id])
    end

    def update
        # raise params.inspect 
        @gear = Gear.find(params[:id])
        if @gear.update(gear_params)
            redirect_to gear_path(@gear)
        else
            render :edit
        end
    end
    
    private
    def gear_params
        params.require(:gear).permit(:level, :rarity, :equip, :main_stat, :enhance_lvl, 
            :stat_1, :stat_1_per, :stat_2, :stat_2_per, :stat_3, :stat_3_per, :stat_4, :stat_4_per)
    end

    def find_gear
        @gear = Gear.find_by(id: params[:id])
    end

end
