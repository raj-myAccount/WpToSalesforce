class SalesforceController < ApplicationController
  skip_before_action :verify_authenticity_token
  def auth

    # Get Access_token
    options = { :body => 
      { :client_id => '3MVG95jctIhbyCpqzTuPUBhIn0jTsIq0VhsWX9lUId3ugRO9jUnnSTBjP3W4MGadvXK46FvsKsQI5anmPMVj1',
        :grant_type => 'refresh_token', 
        :client_secret => '396C353F181C9C0B47B1D11F52210D44AE490A66363F0453BB8F4E280987D600',
        :refresh_token => '5Aep861NEBUy_AOr1eunF7h3ZecDbJkq6lFLo3LQEFiq8xeFTwTgLMhYGjRqFPaN.MJugi6gI61.KzgAmdt.uC2',
      },:headers => {
        'Content-Type' => 'application/x-www-form-urlencoded',
        'grant_type' => 'refresh_token'}
    }

    results = HTTParty.post("https://na172.salesforce.com/services/oauth2/token?
      client_id=3MVG95jctIhbyCpqzTuPUBhIn0jTsIq0VhsWX9lUId3ugRO9jUnnSTBjP3W4MGadvXK46FvsKsQI5anmPMVj1&
      grant_type=refresh_token&
      client_secret=396C353F181C9C0B47B1D11F52210D44AE490A66363F0453BB8F4E280987D600
      &refresh_token=5Aep861NEBUy_AOr1eunF7h3ZecDbJkq6lFLo3LQEFiq8xeFTwTgLMhYGjRqFPaN.MJugi6gI61.KzgAmdt.uC2",options)
    @token_id=JSON.parse(results.to_json)['access_token'];

    # Call Salesforce Method
    options2 = { :body => 
      { 
        :email => 'rfj7714@gmail.com'
      },:headers => {
        'Authorization' => 'Bearer '+@token_id,
        'Content-Type' => 'application/x-www-form-urlencoded'
      }
    }

    results2 = HTTParty.post("https://na172.salesforce.com/services/apexrest/rubycall",options2)
    p "========================================================================"
    p results2
    
  end
end
