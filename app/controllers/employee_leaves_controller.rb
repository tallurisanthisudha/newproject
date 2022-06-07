class EmployeeLeavesController < ApplicationController

    before_action :find_employee_leave, only:[:edit, :destroy, :update]

    def find_employee_leave
        @employee_leave = EmployeeLeave.find(params[:id])
    end

    def edit
    end

    def destroy
        @employee_leave.destroy
        redirect_to employee_leaves_path

    end

    def update
        if @employee_leave.update(employee_leave_params)
            redirect_to index_path
        else
            render "edit"
        end
    end

    def new

        @employee_leave = EmployeeLeave.new
        
    end
        
    def create
        
        @employee_leave= current_employee.employee_leaves.new(employeeleavesparams)
        
        if @employee_leave.save
            redirect_to employee_leaves_path
        else
            render 'new'
        end
        
        
        
    end
        
    def employeeleavesparams
        
        params.require(:employee_leave).permit(:leave_id , :employee_id , :start_date , :end_date , :confirmed_by , :reason)
        
    end

    def index
        @employee_leaves =current_employee.employee_leaves
        @ls= Leave.all
        @el= @ls.count - @employee_leaves.count
    end
end
