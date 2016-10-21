require File.dirname(__FILE__) + '/printfulclient'
require  'pp'

#
# Replace this with your API key
#
key = 'YOUR_API_KEY'

pf = PrintfulClient.new(key)

begin
    #
    #Uncomment any of the following examples to test it
    #
    
    #Get information about the store
    #pp pf.get('store')

    #Get product list
    #pp pf.get('products')

    #Get variants for product 10
    #pp pf.get('products/10')

    #Get information about Variant 1007
    #pp pf.get('products/variant/1007')

    #Select 10 latest orders and get the total number of orders
    #pp pf.get('orders',['limit'=>10])
    #puts  "Total orders available: %i" % [pf.item_count]

    #Select order with ID 12345 (Replace with your order's ID)
    #pp pf.get('orders/12345')

    #Select order with External ID 9900999 (Replace with your order's External ID)
    #pp pf.get('orders/@9900999')

    #Confirm order with ID 12345 (Replace with your order's ID)
    #pp pf.post('orders/12345/confirm')

    #Cancel order with ID 12345 (Replace with your order's ID)
    #pp pf.delete('orders/12345')

    #Create an order
=begin
    pp pf.post('orders',
        {
            recipient:  {
                name: 'John Doe',
                address1: '172 W Providencia Ave #105',
                city: 'Burbank',
                state_code: 'CA',
                country_code: 'US',
                zip: '91502'
            },
            items: [
                {
                    variant_id: 1, #Small poster
                    name: 'Niagara Falls poster', #Display name
                    retail_price: '19.99', #Retail price for packing slip
                    quantity: 1,
                    files: [
                        {url: 'http://example.com/files/posters/poster_1.jpg'}
                    ]
                },
                {
                   variant_id: 1118,
                   quantity: 2,
                   name: 'Grand Canyon T-Shirt', #Display name
                   retail_price: '29.99', #Retail price for packing slip
                   files: [
                        {url: 'http://example.com/files/tshirts/shirt_front.ai'}, #Front print
                        {type: 'back', url: 'http://example.com/files/tshirts/shirt_back.ai'}, #Back print
                        {type: 'preview', url: 'http://example.com/files/tshirts/shirt_mockup.jpg'} #Mockup image
                   ],
                   options: [ #Additional options
                        {id: 'remove_labels', value: true}
                   ]
                }
            ]
         }
    )
=end

    #Create an order and confirm immediately
=begin
    pp pf.post('orders',
        {
            recipient:  {
                name: 'John Doe',
                address1: '172 W Providencia Ave #105',
                city: 'Burbank',
                state_code: 'CA',
                country_code: 'US',
                zip: '91502'
            },
            items: [
                {
                    variant_id: 1, #Small poster
                    name: 'Niagara Falls poster', #Display name
                    retail_price: '19.99', #Retail price for packing slip
                    quantity: 1,
                    files: [
                        {url: 'http://example.com/files/posters/poster_1.jpg'}                  
                    ]
                }
            ]
        },
        {confirm: 1}
    )
=end


    #Calculate shipping rates for an order
=begin
    pp pf.post('shipping/rates',{
        recipient: {
            country_code: 'US',
            state_code: 'CA'
        },
        items: [
           {variant_id: 1,  quantity: 1}, #Small poster
           {variant_id: 1118, quantity: 2} #Alternative T-Shirt
        ]
    })
=end


rescue PrintfulApiException => e
    #Error code from the API
    puts 'API exception: %i %s' % [e.code, e.message]
rescue PrintfulException => e
    #Error while doing the request
    puts 'Printful exception: ' + e.message
end

