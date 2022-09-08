module ApplicationHelper
  def bike_image(brand)
    formatted_brand = brand.downcase.gsub(' ', '')
    brands = %w[ducati benelli harleydavidson kawasaki keeway norton suzuki yamaha]
    if brands.include?(formatted_brand)
      "brands/#{brand.downcase}.png"
    else
      'Icons/motorbike_icon.png'
    end
  end
end
