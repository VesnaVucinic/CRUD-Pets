class Vet < ApplicationRecord
  has_many :pets
  has_many :users, through: :pets
  has_many :reviews
  has_many :reviewers, through: :reviews
  validates :name, :location, :specialty, presence: true
  validates_uniqueness_of  :name, scope: :location



  def self.most_pets
      joins(:pets).group(:id).order('COUNT(pets.id) DESC').limit(3)
  end

  # validate :duplicate
  # def duplicate
  #   if Vet.find_by(name: name, location: location)
  #     errors.add(:name, "This Vet has already been created")
  #   end
  # end

end
