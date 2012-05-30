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
  
  attr_accessible :client_number, :client_type, :industry_type_id, :title, :intials, :name, :surname, :id_number,
                  :is_smp, :smp_number, :smp_rep_code,
                  :fax, :telephone_home, :mobile_number_one, :mobile_number_two, :email_address,
                  :unit_number, :street_name, :suburb, :city,
                  :province, :postal_code, :latitude, :longitude, :created_by,
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
                                  
  # validates :email_address, :format => { :with => email_regex }   
                              
  belongs_to  :user, :primary_key => :id , :foreign_key => :created_by 
  belongs_to  :smp_rep, :primary_key => :smp_rep_code , :foreign_key => :smp_rep_code                                    
  belongs_to  :industry_type
  
  has_many :installations
  
  before_create :generate_client_number
  # before_create :add_creator
  
  scope :by_smp_rep, lambda {|smp_rep_code| where("clients.smp_rep_code =?", smp_rep_code)}
  scope :by_creator, lambda {|user_id| where("clients.created_by =?", user_id)}
  scope :find_smp_clients, where("is_smp = 1")
  
  def self.search(search,type)
    if search
      where('client_number LIKE ? OR name LIKE ? OR surname LIKE ? OR street_name LIKE ? OR smp_number LIKE ? OR smp_rep_code LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")                                
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

  def add_creator
     self.created_by = current_user.id
  end
  
  def full_name
    self.title + ' ' + self.name + ' ' + self.surname
  end
  
  def full_address
    unit_number =  self.unit_number.blank? ?  '' : self.unit_number
    street_name = self.street_name.blank? ? '' : self.street_name
    suburb = self.suburb.blank? ? '' : self.suburb
    city = self.city.blank? ? '' : self.city
    province = self.province.blank? ? '' : self.province
    
    unit_number + ' ' + street_name + ', ' + suburb + ', ' + city + ', ' + province
  end
  
end