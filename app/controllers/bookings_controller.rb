class BookingsController < ApplicationController
  before_action :find_consultation, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

 def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @booking.consultation = @consultation
    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to consultation_path(@consultation)
      flash[:error] = "Booking error, please enter a valid date."
    end
  end

  def edit

  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to dashboard_path
    else
      render :home
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_time, :status)
  end

  def find_consultation
    @consultation = Consultation.find(params[:consultation_id])
  end

end
