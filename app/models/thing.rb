class Thing < ActiveRecord::Base
  has_eav_behavior :class_name => 'ThingData', :table_name => 'thing_data', :name_field => 'attribute', :value_field => 'value'
 #has_flex_attributes  :class_name => 'ThingData', :table_name => 'thing_data', :name_field => 'attribute', :value_field => 'value'
 # has_flex_attributes

end