# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def about
    @team_members = TeamMember.all

    @values = [
        {
          icon: :sustainability,
          title: "Sustainability",
          description: "We commit to eco-friendly practices that protect natural habitats.",
          color: "green"
        },
        {
          icon: :authenticity,
          title: "Authenticity", 
          description: "Genuine local experiences, not tourist traps.",
          color: "amber"
        },
        {
          icon: :shield_check,
          title: "Safety",
          description: "Your well-being is our paramount concern. We maintain the highest standards of precaution.",
          color: "blue"
        },
        {
          icon: :users,
          title: "Community",
          description: "We empower local communities by creating shared value and fostering cultural exchange.",
          color: "violet"
        },
        {
          icon: :sparkles,
          title: "Quality",
          description: "Unwavering commitment to excellence and attention to detail in every aspect of your trip.",
          color: "yellow"
        },
        {
          icon: :rocket_launch,
          title: "Adventure", 
          description: "We craft journeys that push boundaries, ignite curiosity, and create lifelong stories.",
          color: "orange"
        }
  ]
    
  end

  def contact 
  end
end