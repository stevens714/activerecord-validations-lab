class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 10 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
    validate :title_inclusion

    Clickbait_Patterns = [
        "Won't Believe",
        "Secret",
        "Top[number]",
        "Guess"
    ]

    def title_inclusion
        if title.present? && Clickbait_Patterns.none? {|p| title.match(p)}
            errors.add(:title, "try again")
        end
    end


end
