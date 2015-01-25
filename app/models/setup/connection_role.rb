module Setup
  class ConnectionRole
    include Mongoid::Document
    include Mongoid::Timestamps
    include AccountScoped
    include Trackable
       
    has_and_belongs_to_many :connections, class_name: Setup::Connection.name, inverse_of: :connection_roles
    has_and_belongs_to_many :webhooks, class_name: Setup::Webhook.name, inverse_of: :connection_roles
    belongs_to :template, class_name: Setup::Template.name, inverse_of: :connection_roles 

    accepts_nested_attributes_for :webhooks, :connections
    field :name, :type => String

  end
end
