module FoodsHelper
  include Haml::Helpers
  
  def nutrition_facts(food)
    capture_haml do
      haml_tag "div.row" do
        haml_tag "div.col-md-12" do
          haml_concat "Interesting nutrition facts"
        end
      end
    end
    # if food.ndbno
    #   nutritions = food.get_usda_nutrition_facts
    # else
    # end
  end
end
