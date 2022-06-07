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
        
        @projectmanagement = Projectmanagement.new(projectsparams)
  
        respond_to do |format|
          if @projectmanagement.save
            format.html { redirect_to leaves_url, notice: "Leave was successfully created." }
            format.json { render :show, status: :created, location: @projectmanagement }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @projectmanagement.errors, status: :unprocessable_entity }
            format.turbo_stream { render :form_update, status: :unprocessable_entity }
          end
        end
      end
        
    def projectsparams
        
        params.require(:projectmanagement).permit(:project_name , :client, :manager_id, :description , :client_time_zone, :shift_information, :project_type)
        
    end

    def index
        @projectmanagements =Projectmanagement.all
    end 
end
