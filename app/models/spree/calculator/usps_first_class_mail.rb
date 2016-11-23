module Spree
  module Calculator::Shipping
    class UspsFirstClassMail < TeezShipping

      def self.description
        Spree.t(:usps_first_class_mail)
      end

      def self.type
        'STANDARD'
      end
    end
  end
end
