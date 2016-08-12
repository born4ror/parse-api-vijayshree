class ClientDataContent < ActiveRecord::Base
  serialize :links, Array
  serialize :h1, Array
  serialize :h2, Array
  serialize :h3, Array

  def as_json(options={})
    super(:only => [:url, :links, :h1, :h2, :h3])
  end
end
