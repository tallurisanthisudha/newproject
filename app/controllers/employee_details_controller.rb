class EmployeeDetailsController < ApplicationController
    before_action :find_employee_detail, only:[:edit, :destroy, :update]

    def find_employee_detail
        @employee_detail = EmployeeDetail.find(params[:id])

    end

    def edit
    end

    def destroy
        @employee_detail.destroy
        redirect_to employee_details_path



    end

    def update

        respond_to do |format|
        if @employee_detail.update(employee_detailsparams)
        format.html { redirect_to employee_detail_url, notice: "Employee details was successfully updated." }
        format.json { render :show, status: :updated, location: @employee_detail }
    else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee_detail.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
    end
    end

    end

    def new
        @employee_detail = EmployeeDetail.new
    end
        
    def create
        @employee_detail = EmployeeDetail.new(employee_detailsparams)
      
        respond_to do |format|
          if @employee_detail.save
            format.html { redirect_to employee_details_url, notice: "Holiday was successfully created." }
            format.json { render :show, status: :created, location: @employee_detail }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @employee_detail.errors, status: :unprocessable_entity }
            format.turbo_stream { render :form_update, status: :unprocessable_entity }
          end
        end
       


       
        
        
    end
        
    def employee_detailsparams
        
        params.require(:employee_detail).permit(:contact_no,:emergency_contact_no,:designation_id,:employee_id,:manager_id,:blood_group,:work_experience)

        
        
    end

    def index
       @employee_details =current_employee.employee_detail
       @add =current_employee.address.nil?
       @emp= current_employee.employee_detail.nil?
       @addresses= current_employee.address
    end 
    
end
 