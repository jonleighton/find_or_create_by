module ActiveRecord
  module FindOrCreateBy
    def find_or_create_by(conditions)
      find(:first, :conditions => conditions) || create(conditions)
    end
    
    def find_or_create_by!(conditions)
      find(:first, :conditions => conditions) || create!(conditions)
    end
  end
end
