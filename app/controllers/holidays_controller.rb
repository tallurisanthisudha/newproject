class HolidaysController < ApplicationController
    before_action :find_holiday, only:[:edit, :destroy, :update]

    def find_holiday
        @holiday = Holiday.find(params[:id])
    end

    def edit
    end

    def destroy
        @holiday.destroy
        redirect_to index_path

    end

    def update
        if @holiday.update(holiday_params)
            redirect_to index_path
        else
            render "edit"
        end
    end

    def new

        @holiday = Holiday.new
        
    end
        
    def create
        
        @holidays= Holiday.new(holidaysparams)
        
        if @holidays.save
            redirect_to holidays_path
        else
            render 'new'
        end
        #render plain: @holidays.errors.inspect
        
        
    end
        
    def holidaysparams
        
        params.require(:holiday).permit(:name , :date , :year)
        
    end

        def index
            @holidays =Holiday.all
        end 
end
