class Friend < ActiveRecord::Base

  validates :name, :latitude, :longitude, :presence => true
  validate :uniqueness_place

  scope :closests, -> friend { order("(longitude::double precision - (#{friend.longitude}))^2 +
          (latitude::double precision - (#{friend.latitude}))^2").where('id <> ?', friend.id).limit(3) }

  private

    def uniqueness_place
      friend = Friend.where(:latitude => latitude, :longitude => longitude).first
      errors.add(:base, ':uniqueness_place') if friend
    end
end
