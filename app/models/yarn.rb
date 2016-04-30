class Yarn < ActiveRecord::Base
  include Tidy

  belongs_to :user

  before_save :update_yardage_credit
  after_save :total_all
  after_destroy :total_all

  validates :number_of_plies, numericality: { less_than_or_equal_to: 12, greater_than_or_equal_to: 1, only_integer: true }
  validates :measured_yardage, numericality: { less_than_or_equal_to: 10000, greater_than_or_equal_to: 1 }
  validates :name, :measured_yardage, :number_of_plies, presence: true


  protected

  def update_yardage_credit
    if number_of_plies > 1
      self.yardage_credit = measured_yardage + (measured_yardage * number_of_plies)
    else
      self.yardage_credit = measured_yardage
    end
  end

  def total_all
    @total_yardage = (Yarn.where(user_id: self.user_id).sum(:yardage_credit))
    User.find_by(id: self.user_id).update_attributes(total_yardage: @total_yardage)
  end

end
