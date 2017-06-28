class Question < ApplicationRecord
	has_many :answers, dependent: :destroy
	validates :title, presence: true,
                    length: { minimum: 5 }

 	def self.search(search)
 	 where("title LIKE ?", "%#{search}%") 
  	 #where("contents LIKE ?", "%#{search}%")
	end
end