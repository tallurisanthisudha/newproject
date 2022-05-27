class DesignationsController < ApplicationController
    before_action :find_designation, only:[:edit, :destroy, :update]



    def find_designation
        @designation = Designation.find(params[:id])
    end

    def edit
    end

    def destroy
        @designation.destroy
        redirect_to index_path

    end

    def update
        if @designation.update(designation_params)
            redirect_to index_path
        else
            render "edit"
        end
    end

    def new
        @designation = Designation.new
    end
        
    def create
        @designation= Designation.new(designation_params)
        if @designation.save
        #render plain: @designations.errors.inspect
        redirect_to designations_path
        else
            render 'new'
        end
    end
        
    def designation_params
        params.require(:designation).permit(:last_name, :description)
    end

    def index
        @designations =Designation.all
    end    
end
