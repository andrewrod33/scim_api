module Scim
  module ScimTypes
    class Base
      attr_reader :user_hash, :params

      def initialize(params)
        @params = params
        @user_hash = {}
      end
    end
  end
end