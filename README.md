# README

This README will guide you to make this application up and running.

* Prerequisites:
```
ruby: 3.1.2
rails: 7.0.3
postgres
```

* Database creation:

```
rails db:setup
```

* Run the server 
```
bundle install
rails server
```

* How to run the test suite

```
bundle exec rspec
```


* About this application:
This is whole application evolves around campaigns and each campaign can have many investments. 
This is solely api based application, ie it has no views to view :( But the application has been implemented in a way that if we want we can easily integrate front end without making much changes to the existing code base. 
We have implemented two routes primarily. 

1. Campaigns #index

Structure of campaign entity:


Column Name   | Type
------------- | -------------
id            | integer
name          | string
image_url     | string
percentage_raised          | float
target_amount          | float
sector          | integer
country_code          | string
investment_multiple          | float
active          | boolean
created_at          | datetime
updated_at          | datetime


> Request

```http
GET localhost:3000/campaigns.json/?filter_param=...
```

> The response will be in json

```json
[
    {
        "id":41,
        "name":"Rev. Edmond Olson",
        "image_url":"http://rice.name/rae_pfeffer",
        "percentage_raised":0.13654651884520053,
        "target_amount":9799.0,
        "sector":"marketing_campaign",
        "country_code":"BD",
        "investment_multiple":26.0,
        "active":false
    }
]

```

In filter_param we can add the values we want to filter against. Currently the following are implemented:


Filter params   | Type
------------- | -------------
active            | this will list all the campaigns that are active
social_media_campaign          | this will list all the campaigns of social media sector
marketing_campaign     | this will list the marketing sector campaigns
advertising_campaign          | This will list all the advertising sector campaigns


2. Investments #Create

Structure of investments:


Column Name   | Type
------------- | -------------
id            | integer
campaign_id          | integer
investor     | string
amount          | float
created_at          | datetime
updated_at          | datetime



> Request

```http
POST localhost:3000/campaigns/:campaign_id/investments
```

> Body

```json
{ 
  "investment":
    { 
      "investor": "Someone",
      "amount": 14
    },
  "campaign_id": 10
}
```

> The successful response will be in json

```json
{
 "error": "nil",
 "investment":
  {
   "id":7,
   "investor":"Filippo Massarelli",
   "amount":"2000",
   "created_at":"2022-07-22T13:22:23.341Z",
   "updated_at":"2022-07-22T13:22:23.341Z",
   "campaign_id":1
  }
}
```

> The failed response will be in json

```json
{
  "errors": {
    "amount": [ "Must be a multiple of 16.0"]
  }
}
```

Investment has some custom validations. Such as the campaign has to be active in order to invest to, The invested amount has to be multiple of the investment_multiple of the campaign. 
Every time there is a new investment, the percentage_raised of the campaign gets updated. We have added meaningful validation messages to show the error. 
