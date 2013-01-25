class UrlCreator
  def self.create(attrs, finder = Url)
    url = finder.find_by_url(attrs[:url])
    return url if url

    finder.create(attrs)
  end
end
