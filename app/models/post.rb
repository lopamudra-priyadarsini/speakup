class Post < ApplicationRecord


	belongs to :user
	has many :comments

	enum status: [ :draft, :published ]

	#before_update: is_editable?



	def is_ediatble?
		if status.draft?
			true
		else
			false
		end
	end
end
