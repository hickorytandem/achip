class ConsultationsController < ApplicationController
  before_action :find_consultation, only: [:show, :edit, :update, :delete]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params["speciality"].nil?
      @consultations = policy_scope(Consultation.all)
    else
      @consultations = policy_scope(Consultation.all).select do |consultation|
        consultation.user.speciality == params["speciality"]
      end
    end

    if params[:query].present?
      @consultations = Consultation.search_by_title_and_description(params[:query])
    else
      @consultations = policy_scope(Consultation.all)
    end
  end

  def new
    @consultation = Consultation.new
    authorize @consultation
  end

  def show
    authorize @consultation
    @booking = Booking.new
  end

  def edit
    authorize @consultation
  end

  def update
    if @consultation.update(consultation_params)
      redirect_to @consultation, notice: 'Consultation was successfully updated'
    else
      render :edit
    end

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

  def destroy
    @consultation = Consultation.find(params[:id])
    authorize @consultation
    @consultation.destroy
    redirect_to consultations_path
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
