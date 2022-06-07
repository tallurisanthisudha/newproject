class HolidaysController < ApplicationController
    before_action :find_holiday, only:[:edit, :destroy, :update]

    def find_holiday
        @holiday = Holiday.find(params[:id])
    end

    def edit
    end

    def destroy
        @holiday.destroy
        redirect_to holidays_path

    end

    def update
        if @holiday.update(holidaysparams)
            redirect_to holidays_path
        else
            render "edit"
        end
    end

    def new

        @holiday = Holiday.new
        
    end


    def create
        @holiday = Holiday.new(holidaysparams)
      
        respond_to do |format|
          if @holiday.save
            format.html { redirect_to holidays_url, notice: "Holiday was successfully created." }
            format.json { render :show, status: :created, location: @holiday }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @holiday.errors, status: :unprocessable_entity }
            format.turbo_stream { render :form_update, status: :unprocessable_entity }
          end
        end
      end
        

        
    def holidaysparams
        
        params.require(:holiday).permit(:name , :date , :year)
        
    end

        def index
            @holidays =Holiday.all
        end 
end
