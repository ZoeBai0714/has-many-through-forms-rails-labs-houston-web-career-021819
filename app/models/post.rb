class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  
  accepts_nested_attributes_for :categories,
  reject_if: lambda {|attributes| attributes["name"].blank?} end

  def categories_attribute=(category_attributes) # category_attributes come from the form
    categories_attribute.value.each do |categories_attribute|
      my_categories = Category.find_or_create_by(categories_attribute)
      self.categories << my_categories
    end
  end

     