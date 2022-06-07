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
            redirect_to address_path
        else
            render "edit"
        end
    end

    def new

        @address = Address.new
        
    end
        
    def create
        @address = current_employee.build_address(address_params)
        respond_to do |format|
          if @address.save
            format.html { redirect_to addresses_url, notice: "Address was successfully created." }
            format.json { render :show, status: :created, location: @address }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @address.errors, status: :unprocessable_entity }
            format.turbo_stream { render :form_update, status: :unprocessable_entity }
          end
        end
      end
        
    def address_params
        
        params.require(:address).permit(:house_no,:street,:city,:state,:pincode,:country,:employee_id)
        
    end

    def index
       @addresses =Address.all
       
    end 
end
 