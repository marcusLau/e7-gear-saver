class GearsController < ApplicationController
    before_action :find_gear, only: [:show, :edit, :update]


    def index
        @gears = Gears.all
    end

    def new
        @gear = Gear.new
    end

    def create
        @gear = Gear.create(gear_params)
        if @gear
            redirect_to gear_path(@gear) # gears/show.html.erb 
        else
            render :new
        end
    end

    def show
    end
    
    private
    def find_gear
        @gear = Gear.find_by(id: params[:id])
    end


    def gear_params
        params.require(:gear).permit(:level, :rarity, :equip, :main_stat, :enhance_lvl, 
            :stat_1, :stat_1_per, :stat_2, :stat_2_per, :stat_3, :stat_3_per, :stat_4, :stat_4_per)
    end

end
