module NavigationHelper
  def nav_items
    [
      ["Home", root_path],
      ["About Us", pages_about_path],
      ["Destinations", destinations_path],
      ["Trekking", trekkings_path],
      ["Wildlife Safari", safaris_path],
      ["Testimonials", testimonials_path],
      ["Contact Us", pages_contact_path]
    ]
  end
end