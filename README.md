# BingAdsRubySdk - Homelight version

This is a fork from [bing_ads_ruby_sdk](https://github.com/Effilab/bing_ads_ruby_sdk.) 
## Installation

Add the following to your application's Gemfile:

```ruby
gem 'bing_ads_ruby_sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bing_ads_ruby_sdk

## How to use it
This is used to renewal the bing token in homelight growth.

Sidekiq will throw an error from BingWorker::SubmitAdgroupReport with a message like:


    Signet::AuthorizationError: Authorization failed. Server message: {"error":"invalid_grant","error_description":"AADSTS70000: The user could not be authenticated as the grant is expired. The user must sign in again.\r\nTrace ID: b92b9a0e-93f9-4aea-82b2-3015c0a72d00\r\nCorrelation ID: b5357629-ff0c-4cdd-a638-ce66a1d0115d\r\nTimestamp: 2020-09-07 13:30:22Z","error_codes":[70000],"timestamp":"2020-09-07 13:30:22Z","trace_id":"b92b9a0e-93f9-4aea-82b2-3015c0a72d00","correlation_id":"b5357629-ff0c-4cdd-a638-ce66a1d0115d","error_u...


You'll need to follow the instructions from this repo: https://github.com/Effilab/bing_ads_ruby_sdk

and run 

```
rake bing_token:get[my_token.json,your_dev_token,your_bing_client_id]
```

Except when this was built, the gem didn't take in the client secret and will not work, that's why we forked it. 

And run this command from within the directory:

```
rake bing_token:get[my_token.json,your_dev_token,your_bing_client_id,your_bing_secret]
```

(You can find these credentials from Heroku Env variables in the HomeLight Growth repo or through a Microsoft Ads account.)

Follow rake task instructions and then copy the my_token.json file into the bing_token.json file in homelight growth and deploy these changes. Don't forget to rerun the failed Sidekiq jobs and this issue should be resolved.

It seems we need to reauthenticate every year. Last reauthentication was 9/8/21.