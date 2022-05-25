# Violation of the Liskov Substitution Principle in Ruby

=begin
In the example below, we are implementing user statistics. There are two classes: 
a base class (UserStatistic) and its child class (AdminStatistic). The child class violates the 
LSP principle since it completely redefines the base class by returning a string with filtered data, 
whereas the base class returns an array of posts.
=end

class UserStatistic
    def initialize(user)
      @user = user
    end
  
    def posts
      @user.blog.posts
    end
  end
  
  class AdminStatistic < UserStatistic
    def posts
      user_posts = super
  
      string = ''
      user_posts.each do |post|
        string += "title: #{post.title} author: #{post.author}\n" if post.popular?
      end
  
      string
    end
  end