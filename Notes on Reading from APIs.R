
#Accessing twitter api and authentication

myapp = oauth_app("twitter",
                  key="ConsumerKeyHere",
                  secret = "ConsumerSecretHere")

sig = sign_oauth1.0(myapp,
                    token = "TokenHere",
                    token_secret = "TokenSecretHere")
#this uses sig as authentication

#Check documentation from twitter to know what url to use
homeTL = GET("https:api.twitter.com/1.1/statuses/home_timeline.json", sig)

#Use content function to extract data
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json[1:1:4]
