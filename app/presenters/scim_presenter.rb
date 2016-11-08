class ScimPresenter
  attr_reader :user, :scim_body

  def initialize(user)
    @user = user
    @scim_body = {}
  end

  def to_hash
    build_scim_body
  end

  delegate :to_json, :to => :to_hash

  private
  def build_scim_body
    scim_body[:meta] = build_meta
    scim_body[:schemas] = build_schemas
    scim_body[:name] = build_name
    scim_body.merge!(build_base_attributes)
    scim_body
  end

  def build_meta
    {
        created: user.created_at,
        lastModified: user.updated_at
    }
  end

  def build_schemas
    ["urn:scim:schemas:core:1.0"]
  end

  def build_name
    {
      formatted: "#{user.first_name} #{user.last_name}",
      familyName: user.last_name,
      givenName: user.last_name
    }
  end

  def build_base_attributes
    {
        id: user.id,
        userName: user.username,
        title: user.title
    }
  end
end
