class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  #accepts_nested_attributes_for :comments, 
  #reject_if: lambda {|attributes| attributes["username"].blank?}
  accepts_nested_attributes_for :user, reject_if: :all_blank
end

  def user_attributes=(user_attributes) # category_attributes come from the form
    user_attribute.value.each do |user_attribute|
      user = Category.find_or_create_by(user_attribute)
      self.categories << user
  end
end
  
  
 