module Payable
    extend ActiveSupport::Concern
    
    def gateway
       @gateway ||= Braintree::Gateway.new(
          :environment => :sandbox,
          :merchant_id => 'xcd64x8k6qqq27ry',
          :public_key => 'js3wz8tk635wtdbn',
          :private_key => '8c0eb31cba7e5812079090ce8ac4b906',
        )
    end

    included do
    end
  
    class_methods do
    end
end