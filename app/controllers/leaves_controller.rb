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
        if @leave.update(leavesparams)
            redirect_to leaves_path
        else
            render "edit"
        end
    end

    def new

        @leave = Leave.new
        
    end
        

    # ajax calls
def create
    @leave = Leave.new(leavesparams)
  
    respond_to do |format|
      if @leave.save
        format.html { redirect_to leaves_url, notice: "Leave was successfully created." }
        format.json { render :show, status: :created, location: @leave }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leave.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end
        
    def leavesparams
        
        params.require(:leave).permit(:name , :description , :no_of_days)
        
    end

    def index
        @leaves =Leave.all
    end
end
