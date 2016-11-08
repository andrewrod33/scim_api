module Scim
  class ScimTypeBuilder
    attr_reader :params

    def initialize(params)
      @params = params
    end

    # Checks which type of SCIM User is requested
    #
    # @return [Class] class that correlates with the SCIM builder type
    def build_type
      # return build("enterprise") if params
      # return build("core") if && params["isPrivate"] == false
      return build("core")
    end

    def build(type)
      klass = constantize_type(type)
      klass.new(params)
    end

    private
    def constantize_type(type)
      "#{namespace}::#{type.singularize.camelize}".constantize
    end

    def namespace
      "Scim::ScimTypes"
    end
  end
end
