class Crossbill
    include Mongoid::Document
    include Mongoid::Timestamps
    field :type, type: String
    field :properties, type: Object
    field :geometry, type: Object
  end