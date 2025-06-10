class Article < ApplicationRecord
  before_validation :generate_slug
  belongs_to :user

  validates :slug, presence: true, uniqueness: true

  def to_param
    slug
  end

  private

  def generate_slug
    base_slug = title.to_s.parameterize
    self.slug = base_slug.presence || SecureRandom.hex(6) if slug.blank?
  end
end
