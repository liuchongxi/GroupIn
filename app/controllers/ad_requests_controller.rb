class AdRequestsController < ApplicationController
  def index
  	@requests = AdRequest.all
  end

  def show
  	@request = AdRequest.find(params[:id])
  end

  def new
  	@request = AdRequest.new
  end

  def create
  	@request = AdRequest.new(request_params)

    if @request.save
      	redirect_to @request
    else  
      render('new')
      flash[:notice] = "Please check, correct information, and re-submit to create request"
    end  
  end

  def delete
    @request = AdRequest.find(params[:id])
  end

  def destroy
    @request = AdRequest.find(params[:id])
    @request.destroy
    flash[:notice] = "Request '#{@request.ad_name}' destroyed successfully."
    redirect_to(ad_requests_path)
  end

  private
  
  def request_params
    params.require(:ad_request).permit(:ad_name, :first_name, :last_name, :phone_num, :email, :request_detail)
  end  


end

