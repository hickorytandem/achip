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
    @booking.consultation = @consultation
    if @booking.save
      redirect_to consultation_path(@consultation)
    else
      render :new
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
