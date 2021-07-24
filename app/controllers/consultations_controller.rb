class ConsultationsController < ApplicationController
  before_action :find_consultation, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params["speciality"].nil?
      @consultations = policy_scope(Consultation.all)
    else
      @consultations = policy_scope(Consultation.all).select do |consultation|
        consultation.user.speciality == params["speciality"]
      end
    end
  end

  def new
    @consultation = Consultation.new
  end

  def show
    authorize @consultation
    @booking = Booking.new
  end

  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.user = current_user
    authorize @consultation
    if @consultation.save
      redirect_to consultation_path(@consultation)
    else
      render :new
    end
  end

  private

  def consultation_params
    params.require(:consultation).permit(:title, :description, :price, :duration)
  end

  def find_consultation
    @consultation = Consultation.find(params[:id])
    authorize @consultation
  end

end
