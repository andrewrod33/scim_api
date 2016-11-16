class UserSerializer < ActiveModel::Serializer
  attributes :schemas, :id, :userName, :title, :meta, :name

  def meta
    {
        created: object.created_at,
        lastModified: object.updated_at
    }
  end

  def schemas
    ["urn:scim:schemas:core:1.0"]
  end

  def name
    {
        formatted: "#{object.first_name} #{object.last_name}",
        familyName: object.last_name,
        givenName: object.last_name
    }
  end

  def userName
    object.username
  end
end
