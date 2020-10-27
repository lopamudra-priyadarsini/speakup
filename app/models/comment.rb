class Comment < ApplicationRecord


	belongs to :post
	belongs to :user
end
