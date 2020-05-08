class ServiceRequestsController < ApplicationController
  before_action :set_service_request, only: [:show, :edit, :update, :destroy]

  def index
    @service_requests = ServiceRequest.all
  end

  def show; end

  def new
    @show_recipient ||= false
    session[:parcels] ||= []
    @service_request_form ||= ServiceRequestForm.new
  end

  def edit; end

  def create
    @service_request = ServiceRequest.new(service_request_params)

    if @service_request.save
      redirect_to @service_request, notice: 'Service request was successfully created.'
    else
      render :new
    end
  end

  def update
    if @service_request.update(service_request_params)
      redirect_to @service_request, notice: 'Service request was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @service_request.destroy
    redirect_to service_requests_url, notice: 'Service request was successfully destroyed.'
  end

  private
    def set_service_request
      @service_request = ServiceRequest.find(params[:id])
    end

    def service_request_params
      params.require(:service_request).permit(:recipient_id, :description, :notes, :pickup_address_id, :delivery_address_id, :pickup_tracking_link, :pickup_after, :pickup_before, :picked_up_at, :deliver_before, :delivery_tracking_link, :status)
    end

    def service_request_form_params
      params.dig(:service_request)&.permit(*ServiceRequestForm.attributes)
    end
end
