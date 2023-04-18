class Api::V1::FedexController < ApplicationController
  def get
    package_params = {
      address_from: {
        zip: params["address_from.zip"],
        country: params["address_from.country"]     
      },
      address_to: {
        zip: params["address_to.zip"],
        country: params["address_to.country"]      
      },
      package:{
        length: params["package.length"],
        width: params["package.width"],
        heigth: params["package.height"],
        distance_unit: params["package.distance_unit"], 
        weigth: params["package.weight"],
        mass_unit: params["package.mass_unit"]
      }
    }
    
    # Using the Fedexws gem
    b = Fedexws::Rates.new
    rates = b.get(package_params) 

    # Hashing xml
    json_data = Hash.from_xml(rates)

    render json: { results: json_data }.to_json, status: :ok
  end
end
