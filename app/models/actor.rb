class Actor < ApplicationRecord
  scope :alphabetical, -> { order(name: :asc) }

  validates :name, presence: true
  validates :tmdb_id, uniqueness: { allow_blank: true }

  enum gender: { "Not specified" => 0, "Female" => 1, "Male" => 2 }

  def profile?
    profile_path.present?
  end

  def profile_url(version="original")
    tmdb_image(profile_path, version)
  end
end