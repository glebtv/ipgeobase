class Ipgeobase::IpgeobaseRegion < ActiveRecord::Base
  has_ancestry

  has_many :ipgeobase_ips

  before_save :cache_ancestry
  before_create :cache_ancestry

  validates :name, :presence => true

  def cache_ancestry
    self.names_depth_cache = path.map(&:name).join('/')
  end


end