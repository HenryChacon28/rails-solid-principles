# Correct use of the Liskov Substitution Principle in Ruby

=begin
To comply with the LSP principle, we can segregate the filtration logic and the statistics 
string generation logic into two methods: “posts“ and “formatted_posts“. 
Therefore, we refactored the method posts that filtrates user posts, so the method returns the 
same type of data as the base class.
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
      user_posts.select { |post| post.popular? }
    end
  
    def formatted_posts
      posts.map { |post| "title: #{post.title} author: #{post.author}" }.join("\n")
    end
  end