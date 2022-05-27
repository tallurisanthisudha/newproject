class AddressesController < ApplicationController
    before_action :find_address, only:[:edit, :destroy, :update]

    def find_address
        @address = Address.find(params[:id])
    end

    def edit
    end

    def destroy
        @address.destroy
        redirect_to employee_details_path

    end

    def update
        if @address.update(address_params)
            redirect_to employee_details_path
        else
            render "edit"
        end
    end

    def new

        @address = Address.new
        
    end
        
    def create
        
        @address= Address.new(address_params)
        
        if @address.save
            redirect_to employee_details_path
        else
            render 'new'
        end
        #render plain: @holidays.errors.inspect
         
        
    end
        
    def address_params
        
        params.require(:address).permit(:street,:city,:state,:pincode,:country,:employee_id)
        
    end

    def index
       @addresses =Address.all
       
    end 
end
 