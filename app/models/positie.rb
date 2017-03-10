class Positie
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

   before_validation :set_fabrikaat_and_systeem

  field :number,    type: Integer,  required: true, unique: {:scope => :calculatie}
  field :name,      type: String,   required: true, unique: true
  field :location,  type: String

  belongs_to :calculatie, required: true

  belongs_to :fabrikaat, required: true
  belongs_to :systeem, required: true

    private
      def set_fabrikaat_and_systeem
        self.fabrikaat = Fabrikaat.first
        self.systeem = Systeem.first
      end
end