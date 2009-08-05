# Include hook code here
$: << File.dirname(__FILE__) + "/lib"
require "find_or_create_by"
ActiveRecord::Base.send(:extend, ActiveRecord::FindOrCreateBy) if defined?(ActiveRecord::Base)
