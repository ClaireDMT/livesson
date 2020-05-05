class Template < ApplicationRecord
  belongs_to :eleve
  belongs_to :sport
  belongs_to :activity
  has_many :templates
  validates :template_name, :template_description,
            :template_material_needed, presence: true
end
