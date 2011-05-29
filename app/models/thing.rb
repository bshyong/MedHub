#require 'digest/sha2'

class Thing < ActiveRecord::Base
# has_eav_behavior :class_name => 'ThingData', :table_name => 'thing_data', :name_field => 'name', :value_field => 'value'
 #has_flex_attributes  :class_name => 'ThingData', :table_name => 'thing_data', :name_field => 'attribute', :value_field => 'value'

#      attr_accessor :new_password, :new_password_confirmation
#    validates_confirmation_of :new_password, :if=>:password_changed?
#
#    before_save :hash_new_password, :if=>:password_changed?
#
#    def password_changed?
#      !@new_password.blank?
#    end
#
#    def self.authenticate(email, password)
#
#      if user = find_by_email(email)
#        if user.hashed_password == Digest::SHA2.hexdigest(user.salt + password)
#          return user
#        end
#      end
#      return nil
#    end
#
#    private
#
#    def hash_new_password
#      self.salt = ActiveSupport::SecureRandom.base64(8)
#      self.hashed_password = Digest::SHA2.hexdigest(self.salt + @new_password)
#    end


end