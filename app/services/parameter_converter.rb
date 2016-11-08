module Services
  class ParameterConverter
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def convert
      keys = params.transform_keys{ |key| key.to_s.underscore.to_sym }
      keys
    end

    def transform_key
    end

    def transform_keys_for_array
    end

    def transform_keys_for_hash
    end
  end
end