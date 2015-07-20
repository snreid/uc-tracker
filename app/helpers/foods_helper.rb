module FoodsHelper
  include Haml::Helpers

  def nutrition_facts(food)
    capture_haml do
      if food.usda_ndbno.present?
        nutritions = food.get_usda_nutrition_facts.report.food.nutrients
        haml_tag  "ul" do
          nutritions.each do |nutr|
            haml_tag "li" do
              haml_tag :strong, nutr.name + ": "
              haml_concat( nutr.value + nutr.unit)
            end
          end  
        end
      else
        output_stored_nutrition_facts(food)
      end

    end
  rescue
    capture_haml do
      haml_tag "h5" do
        haml_concat "The USDA API is not available at this time. You may not be connected to the internet."
      end
      output_stored_nutrition_facts(food)
    end
  end

  def output_stored_nutrition_facts(food)
    haml_tag "ul" do
      haml_tag "li" do
        haml_concat("Serving Size: " + food.serving_size.to_s) 
      end
      haml_tag "li" do
        haml_concat("Calories: " + food.calories.to_s) 
      end
      haml_tag "li" do
       haml_concat("Fat: " + food.fat.to_s)
      end
      haml_tag "li" do
        haml_concat("Carbohydrates: " + food.carbohydrates.to_s) 
      end
      haml_tag "li" do
       haml_concat("Protein: "+ food.protein.to_s)
      end
      haml_tag "li" do 
        haml_concat("Fiber: " + food.fiber.to_s) 
      end
      haml_tag "li" do 
        haml_concat("Sodium: " + food.sodium.to_s) 
      end
      haml_tag "li" do 
        haml_concat("Sugars: " + food.sugars.to_s) 
      end
    end
  end
end

