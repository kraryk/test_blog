class Tag < ActiveRecord::Base
	has_and_belongs_to_many :posts

	def self.tags_from_params(tag_string)
		SEPARATOR = ", "
		return  tag_string.split(SEPARATOR)
	end

	def self.find_or_create(tag_names)
		tags = Array.new
  		tag_names.each do |tag_name|
  			allready_exist = self.find_by name: tag_name
    		if allready_exist
          		tags << allready_exist
        	else
          		tags << Tag.new(name: tag_name)
        	end
    	end
     	return tags
	end
end
