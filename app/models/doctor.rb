class Doctor < ApplicationRecord 
    belongs_to :user 
    has_many :healthcare_teams 
    has_many :patients, through: :healthcare_teams 

    scope :general_practice, -> { where(specialty: "General Practice") }

    # validates :title, presence: true, inclusion: { in: ["Dentist", "Cardiologist"] }

    def fullname 
        self.user ? self.user.fullname : nil 
    end 

    def self.family_medicine 
        where(specialty: "Family Medicine")
    end 

    def self.specialties
        select(:specialty).distinct.order(specialty: :asc)
    end 

    def self.by_specialty(specialty)
        where(specialty: specialty)
    end 

    def specialty_slug
        self.specialty.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end 

    def self.find_by_slug(slug)
        self.all.find {|doctor| doctor.slug == slug}
    end 
end 