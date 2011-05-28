class Thing < ActiveRecord::Base
  has_eav_behavior :options => {:class_name => "ThingData", :table_name => 'thing_data', :name_field => 'attribute', :value_field => 'value'}
end