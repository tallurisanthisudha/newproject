class ProjectmanagementsController < ApplicationController
    before_action :find_project, only:[:edit, :destroy, :update]

    def find_project
        @projectmanagement = Projectmanagement.find(params[:id])
    end

    def edit
    end

    def destroy
        @projectmanagement.destroy
        redirect_to projectmanagements_path

    end

    def update
        if @projectmanagement.update(projectsparams)
            redirect_to projectmanagements_path
        else
            render "edit"
        end
    end

    def new

        @projectmanagement = Projectmanagement.new
        
    end
        
    def create
        
        @projectmanagement= Projectmanagement.new(projectsparams)
        
        if @projectmanagement.save
            redirect_to projectmanagements_path
        else
            render 'new'
        end
        #render plain: @holidays.errors.inspect
        
        
    end
        
    def projectsparams
        
        params.require(:projectmanagement).permit(:project_name , :client, :manager_id, :description , :client_time_zone, :shift_information, :project_type)
        
    end

    def index
        @projectmanagements =Projectmanagement.all
    end 
end
