class Offerte
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :number, type: Integer, required: true, unique: true, length: { is: 8 }, index: true
  field :description
  field :posities, type: Hash, default: { }

  belongs_to :calculatie, required: true

  def pos_total
    Calculatie.first.posities.map{ |positie|
      {
        number: positie.number, 
        name: positie.name,
        fabrikaat: positie.fabrikaat.name,
        systeem: positie.systeem.name,
        netto: positie.total_netto
      }
    }
  end

end