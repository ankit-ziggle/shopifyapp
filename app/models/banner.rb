class Banner < ApplicationRecord
    belongs_to :shop

    before_save :change_default

    def change_default
        if self.default
            Banner.where.not(id:self.id).update_all(default:false)
            
        end
    end
end
