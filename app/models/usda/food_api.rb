module USDA
  class FoodAPI

    attr_accessor :api


    def api
      @api ||= API.new
    end

    # What params it accepts http://ndb.nal.usda.gov/ndb/doc/apilist/API-SEARCH.md
    def search(params = {})
      JsonObject.new( api.json_response("search/", params) )
    end

    # http://ndb.nal.usda.gov/ndb/doc/apilist/API-NUTRIENT-REPORT.md
    def nutrients(params = {})
      JsonObject.new( api.json_response("nutrients/", params) )
    end
    
    # http://ndb.nal.usda.gov/ndb/doc/apilist/API-FOOD-REPORT.md
    # Get a specific item by ndbno
    def reports(params = {})
      JsonObject.new( api.json_response("reports/", params) )
    end

    def specific(ndbno)
      reports({ndbno: ndbno})
    end
  end
end