class TVShow < ApplicationRecord
  include Media

  include PgSearch::Model
  pg_search_scope :pg_search, against: [:name, :overview], using: { tsearch: { prefix: true, tsvector_column: "tsv" } }

  STATUSES = [
    'Returning Series',
    'Planned',
    'In Production',
    'Ended',
    'Canceled',
    'Pilot'
  ]

  has_many :seasons, -> { ordered }, inverse_of: :tv_show

  has_and_belongs_to_many :genres, -> { alphabetical }, class_name: "TVShow::Genre"

  validates :name, :status, presence: true
  validates :tmdb_id, uniqueness: { allow_blank: true }

  def tmdb_url
    "https://www.themoviedb.org/tv/#{tmdb_id}"
  end
end
