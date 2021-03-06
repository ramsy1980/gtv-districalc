class Systeem
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :name, type: String, unique: true, required: true
  field :klass, type: String, required: true
  field :has_door, type: Boolean, required: true, default: true

  belongs_to :fabrikaat
  belongs_to :color
  belongs_to :ip_value

  has_many :calculaties
  has_many :fabrikaat_systemen, dependent: :destroy

end
