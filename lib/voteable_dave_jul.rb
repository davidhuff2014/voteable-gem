# encoding: UTF-8

# module for counting votes
module VoteableDaveJul
  extend ActiveSupport::Concern

  # executes this code when included only once
  included do
    has_many :votes, as: :voteable
  end

  # handles counting votes for comments and posts
  def total_votes
    self.up_votes - self.down_votes
  end

  def up_votes
    self.votes.where(vote: true).size
  end

  def down_votes
    self.votes.where(vote: false).size
  end

  # module ClassMethods
  #   def my_class_method

  #   end
  # end
end
