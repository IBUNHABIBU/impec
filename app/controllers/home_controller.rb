class HomeController < ApplicationController
  def index
    @hero = Hero.first
    @featured_tours = TravelTour.featured.limit(3)
    @popular_destinations = Destination.featured.limit(3) # Add this line
    @testimonials = Testimonial.order(rating: :desc).limit(3) # Add this line
    @cta =   @cta = {
      title: "Ready for Your Next Adventure?",
      subtitle: "Join thousands of happy travelers who've explored with us",
      button_text: "Book Now",
      button_url: travel_tours_path,
      secondary_button_text: "Contact Us",
      secondary_button_url: root_path,
      background_color: "green-800"
    }
  end

  private
    def default_cta
      OpenStruct.new(
        title: "Ready for Your Next Adventure?",
        subtitle: "Join thousands of happy travelers who've explored with us",
        button_text: "Book Now",
        button_url: tours_path,
        secondary_button_text: "Contact Us",
        secondary_button_url: contact_path
      )
   end
end
