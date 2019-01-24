class Noticeboard < ApplicationRecord
    
    validates:title,  presence:true, length:{ minimum:4 }
    validates:content,  presence:true, length:{ minimum: 5 }
    

end
