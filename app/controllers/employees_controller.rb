class EmployeesController < ApplicationController
    before_action :find_employee, only:[:edit, :destroy, :update]

    def find_employee
        @employee = Employee.find(params[:id])
    end

    def edit
    end

    def destroy
        @employee.destroy
        redirect_to employees_path

    end

    def update
        if @employee.update(employee_params)
            redirect_to index_path
        else
            render "edit"
        end
    end

    def new

        @employee = Employee.new
        
    end


    def create
        @employee = Employee.new(employeesparams)
        respond_to do |format|
          if @employee.save
            format.html { redirect_to designation_url, notice: "Designation was successfully created." }
            format.json { render :show, status: :created, location: @employee }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @employee.errors, status: :unprocessable_entity }
            format.turbo_stream { render :form_update, status: :unprocessable_entity }
          end
        end
      end
        
    
        
    def employeesparams
        
        params.require(:employee).permit(:first_name , :last_name , :employee_unique_id , :role_id , :email , :password)
        
    end

    def index
        @q =Employee.ransack(params[:q])
        @employees = @q.result(distint: true).page(params[:page])
        
    end
end
