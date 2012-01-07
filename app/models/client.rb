# == Schema Information
#
# Table name: Clients
#
# id                 :integer         not null, primary key
# client_number      :string(255)      not null
# client_type        :integer(255)      not null
#
class Client < ActiveRecord::Base
  
  acts_as_commentable
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  attr_accessible :client_number, :client_type, :title, :intials, :name, :surname, :id_number,
                  :is_smp, :smp_no, :smp_rep_code,
                  :fax, :telephone_home, :mobile_number_one, :mobile_number_two, :email_address,
                  :unit_number, :street_name, :suburb, :city,
                  :province, :postal_code, :latitude, :longitude,
                  :created_at, :updated_at
       
  validates :client_number, :uniqueness => true, :on => :create
  validates :name, :presence => true, 
                               :length => {
                                  :minimum   => 3,
                                  :maximum   => 20,
                                  :too_short => "must have at least %{count} characters",
                                  :too_long  => "must have at most %{count} characters"
                                } 
  validates :surname, :presence => true, 
                               :length => {
                                  :minimum   => 3,
                                  :maximum   => 20,
                                  :too_short => "must have at least %{count} characters",
                                  :too_long  => "must have at most %{count} characters"
                                }     
  validates :email_address, :presence => true,
                            :format => { :with => email_regex }                                      
  
  has_many :installations, :dependent => :destroy
  
  before_create :generate_client_number
  
  def self.search(search,type)
    if search
      where('name LIKE ? OR surname LIKE ? OR street_name LIKE ? OR smp_number LIKE ? OR smp_rep_code LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")                                
    else
      scoped
    end        
  end
  
  def self.count_on(date)
    where("date(created_at) = ?",date).count(:id)
  end
  
  def generate_client_number
    record = true
    while record
      random = "C#{Array.new(9){rand(9)}.join}"
      record = self.class.find(:first, :conditions => ["client_number = ?", random])
    end
    self.client_number = random if self.client_number.blank?
    self.client_number
  end
  
  def fullname
    self.title + ' ' + self.name + ' ' + self.surname
  end
  
end