class AdminController < ApplicationController
  def new
    @leaves = Leave.new
  end
  def create
    @leaves = Leave.new(leaveparams)
    @leaves.save
    render plain: @leaves.errors.inspect
  end
  def leaveparams
    params.permit(:name, :description)
  end

  def employeemanagement
    @employees = Employee.all
  end
    
  def adminhome
    @leaves = Leave.all
  end

end
  