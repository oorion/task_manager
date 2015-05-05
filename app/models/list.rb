class List < ActiveRecord::Base
  def self.unarchived
    where(archived: false)
  end

  def self.archived
    where(archived: true)
  end
end
