class DesignationsController < ApplicationController
    before_action :find_designation, only:[:edit, :destroy, :update]



    def find_designation
        @designation = Designation.find(params[:id])
    end

    def edit
    end

    def destroy
        @designation.destroy
        redirect_to designations_path

    end

    def update
        if @designation.update(designation_params)
            redirect_to designations_path
        else
            render "edit"
        end
    end

    def new
        @designation = Designation.new
    end

    
     
    def create
        @designation = Designation.new(designation_params)
        respond_to do |format|
          if @designation.save
            format.html { redirect_to designations_url, notice: "Designation was successfully created." }
            format.json { render :show, status: :created, location: @designation }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @designation.errors, status: :unprocessable_entity }
            format.turbo_stream { render :form_update, status: :unprocessable_entity }
          end
        end
      end
        
    
        
    def designation_params
        params.require(:designation).permit(:last_name, :description)
    end

    def index
        @designations =Designation.all
    end    
end
