class PagesController < ApplicationController
  # after_action :skip_pundit
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @expertises = ["IT", "Media", "Sales", "Editing", "UX Design"]
    @consultations = policy_scope(Consultation.all)
    @top_consultations = @consultations.sample(6)
  end

  def dashboard
    @bookings = Booking.all
    @consultations = Consultation.all
  end

end
