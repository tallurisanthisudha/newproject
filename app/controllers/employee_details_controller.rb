class EmployeeDetailsController < ApplicationController
    before_action :find_employee_detail, only:[:edit, :destroy, :update]

    def find_employee_detail
        @employee_detail = EmployeeDetail.find(params[:id])

    end

    def edit
    end

    def destroy
        @employee_detail.destroy
        redirect_to index_path



    end

    def update
        if @employee_detail.update(employee_detail_params)
            redirect_to index_path
        else
            render "edit"
        end



    
    end

    def new

        @employee_detail = EmployeeDetail.new


        
    end
        
    def create
        
        @employee_detail= EmployeeDetail.new(employee_detailsparams)
        
        if @employee_detail.save
            redirect_to employee_details_path
        else
            render 'new'
        end
        #render plain: @holidays.errors.inspect


       
        
        
    end
        
    def employee_detailsparams
        
        params.require(:employee_detail).permit(:contact_no,:emergency_contact_no,:designation_id,:employee_id,:manager_id,:blood_group,:work_experience)

        
        
    end

    def index
       @employee_details =EmployeeDetail.all

       @addresses= Address.all
    end 
    
end
 