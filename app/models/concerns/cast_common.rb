module CastCommon
  extend ActiveSupport::Concern

  DIFF_FIELDS = %i(person_id name part sort_number).freeze
  PUBLISH_FIELDS = (DIFF_FIELDS + %i(work_id)).freeze

  included do
    belongs_to :person
    belongs_to :work, touch: true

    validates :person_id, presence: true
    validates :work_id, presence: true
    validates :name, presence: true
    validates :part, presence: true

    def to_diffable_hash
      data = self.class::DIFF_FIELDS.each_with_object({}) do |field, hash|
        hash[field] = send(field)
        hash
      end

      data.delete_if { |_, v| v.blank? }
    end
  end
end
