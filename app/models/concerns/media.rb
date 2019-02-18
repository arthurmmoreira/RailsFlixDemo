module Media
  def score
    (vote_average * 10).to_i
  end

  def poster?
    poster_path.present?
  end

  def poster_url(version="original")
    tmdb_image(poster_path, version)
  end

  def backdrop?
    backdrop_path.present?
  end

  def backdrop_url(version="original")
    tmdb_image(backdrop_path, version)
  end

  def tmdb_image(path, version="original")
    "https://image.tmdb.org/t/p/#{version}#{path}"
  end
end