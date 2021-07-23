class PagesController < ApplicationController
  def home
    @expertises = ["IT", "Media", "Sales", "Editing", "UX Design"]
    @consultations = policy_scope(Consultation.all)
    @top_consultations = @consultations.sample(6)
  end

  def dashboard
    @bookings = Booking.all
  end
end
