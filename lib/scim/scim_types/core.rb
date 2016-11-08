module Scim
  module ScimTypes
    class Core < Base
      def create
        build_user_hash
        User.new(user_hash)
      end

      def build_user_hash
        build_name
        user_hash[:username] = params[:userName]
      end

      def build_name
        return unless params.has_key? :name
        user_hash[:first_name] = params[:name][:familyName]
        user_hash[:last_name] = params[:name][:givenName]
      end
    end
  end
end
