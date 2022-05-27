class LeavesController < ApplicationController
    before_action :find_leave, only:[:edit, :destroy, :update]

    def find_leave
        @leave = Leave.find(params[:id])
    end

    def edit
    end

    def destroy
        @leave.destroy
        redirect_to leaves_path

    end

    def update
        if @leave.update(leave_params)
            redirect_to index_path
        else
            render "edit"
        end
    end

    def new

        @leave = Leave.new
        
    end
        
    def create
        
        @leave= Leave.new(leavesparams)
        
        if @leave.save
            redirect_to leaves_path
        else
            render 'new'
        end
        
        
        
    end
        
    def leavesparams
        
        params.require(:leave).permit(:name , :description)
        
    end

    def index
        @leaves =Leave.all
    end
end
