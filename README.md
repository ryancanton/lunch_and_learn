<h1 align="center">
  Lunch and Learn
</h1>

<p align="center">
  <img width="600" src="https://wp.en.aleteia.org/wp-content/uploads/sites/2/2018/05/web3-mediterranean-food-middle-eastern-food-israeli-dishes-falafel-hummus-pita-bread-shutterstock.jpg?w=640&crop=1">
</p>

## Table of Contents

- [Project Overview](#project-overview)
- [Schema](#schema)
- [API Endpoints](#api-endpoint-examples)
- [Setup and Installation](#setup-and-installation)
- [Learning Goals](#learning-goals)
- [API Information](#api-information)
- [About](#responsible-parties)

## Project Overview

Lunch and Learn is an API service that pulls data from <b>5</b> other open source APIs to gather and return info on recipes, images, educational videos, and tourist sights based on a given country. If no country is given, one is chosen at random. Registered users can save recipes to their favorites.

## Schema
<p align="center">
  <img width="600" src="https://user-images.githubusercontent.com/113324661/223798963-98bff126-ee29-466f-be3d-0f3525e28a78.png">
</p>

## API Endpoint Examples


## GET recipe info based on search by country feature

<b>Request:</b>
```
  GET /api/v1/recipes?country=thailand
  Content-Type: application/json
  Accept: application/json
```
<b>Response:</b>
```json 
  {
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com..."
            }
        },
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Sriracha",
                "url": "http://www.jamieoliver.com/recipes/vegetables-recipes/sriracha/",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com/."
            }
        },
        {...},
        {...},
        {...},
        {etc},
    ]
  }
```
## GET images and an informative YouTube video based on search by country feature

<b>Request:</b>
```
  GET /api/v1/learning_resources?country=laos
  Content-Type: application/json
  Accept: application/json
```
<b>Response:</b>
```json
  {
      "data": {
          "id": null,
          "type": "learning_resource",
          "attributes": {
              "country": "laos",
              "video": {
                  "title": "A Super Quick History of Laos",
                  "youtube_video_id": "uw8hjVqxMXw"
              },
              "images": [
                  {
                      "alt_tag": "standing statue and temples landmark during daytime",
                      "url": "https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                  },
                  {
                      "alt_tag": "five brown wooden boats",
                      "url": "https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwyfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                  },
                  {
                      "alt_tag": "orange temples during daytime",
                      "url": "https://images.unsplash.com/photo-1563492065599-3520f775eeed?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwzfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
                  },
                  {...},
                  {...},
                  {...},
                  {etc},
                ]
          }
      }
  }
```
## GET tourist sights within a <b>20,000</b> meter radius of the given country's capital

<b>Request:</b>
```
  GET /api/v1/tourist_sights?country=japan
  Content-Type: application/json
  Accept: application/json
```
<b>Response:</b>
```json
  {
      "data": [
          {
              "id": null,
              "type": "tourist_sight",
              "attributes": {
                  "name": "東京スカイツリー",
                  "address": "Tokyo Skytree, 13 1F, Narihira 1-chome, Sumida, 131-0045, Japan",
                  "place_id": "5187a7a75ef179614059510200c5e2da4140f00102f9015ba32e1100000000920318e69db1e4baace382b9e382abe382a4e38384e383aae383bc"
              }
          },
          {
              "id": null,
              "type": "tourist_sight",
              "attributes": {
                  "name": "皇居",
                  "address": "Imperial Palace, Yamashita Street, Hanzomon, Chiyoda, 100-0001, Japan",
                  "place_id": "5103947a2604786140592e26135f84d74140f00102f9019bb6df1f00000000920306e79a87e5b185"
              }
          },
          {
              "id": null,
              "type": "tourist_sight",
              "attributes": {
                  "name": "迎賓館",
                  "address": "Akasaka Palace, 1 Akasaka Tunnel, Motoakasaka 2-chome, Minato, 107-0051, Japan",
                  "place_id": "51d3e47e1a527761405911cd408714d74140f00101f9011c385d0000000000920309e8bf8ee8b393e9a4a8"
              }
          },
          {...},
          {...},
          {...},
          {etc},

      ]
  }
```
## POST Create a new user with a JSON payload in the body of the request

<b>Request:</b>
```
  POST /api/v1/users
  Content-Type: application/json
  Accept: application/json

  {
    "name": "Athena Dao",
    "email": "athenadao@bestgirlever.com"
  }
```
<b>Response:</b>
```json
  {
    "data": {
      "type": "user",
      "id": "1",
      "attributes": {
        "name": "Athena Dao",
        "email": "athenadao@bestgirlever.com",
        "api_key": "jgn983hy48thw9begh98h4539h4"
      }
    }
  }
```
## POST Create a new favorite if api key is valid

<b>Request:</b>
```
  POST /api/v1/favorites
  Content-Type: application/json
  Accept: application/json

  {
      "api_key": "jgn983hy48thw9begh98h4539h4",
      "country": "thailand",
      "recipe_link": "https://www.tastingtable.com/.....",
      "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
  }
```
<b>Response:</b>
```json
  {
      "success": "Favorite added successfully"
  }
```
## GET a list of a users favorites

<b>Request:</b>
```
  GET /api/v1/favorites?api_key=jgn983hy48thw9begh98h4539h4
  Content-Type: application/json
  Accept: application/json
```
<b>Response:</b>
```json
   {
      "data": [
          {
              "id": "1",
              "type": "favorite",
              "attributes": {
                  "recipe_title": "Recipe: Egyptian Tomato Soup",
                  "recipe_link": "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight....",
                  "country": "egypt",
                  "created_at": "2022-11-02T02:17:54.111Z"
              }
          },
          {
              "id": "2",
              "type": "favorite",
              "attributes": {
                  "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)",
                  "recipe_link": "https://www.tastingtable.com/.....",
                  "country": "thailand",
                  "created_at": "2022-11-07T03:44:08.917Z"
              }
          }
      ]
   }
```

## Setup and Installation

From your terminal, run:

- ```git clone git@github.com:ryancanton/lunch_and_learn.git```
- ```bundle install```
- ```rails db:{create,migrate}```
- To run the tests: ```bundle exec rspec```

## Learning Goals

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## API Information


This application are consumes the <a href= "https://restcountries.com/#api-endpoints-v3-all">REST Countries API</a>, <a href= "https://developer.edamam.com/edamam-recipe-api">Edamam Recipes API</a>, <a href= "https://developers.google.com/youtube/v3/getting-started">YouTube API</a>, <a href= "https://apidocs.geoapify.com/docs/places/#about">Places API</a>, and <a href= "https://unsplash.com/documentation">UnSplash Images API</a>.
Each of these public APIs requires an authorized API key. Visit API webpages above to get your free API keys.

## Responsible Parties

| [<img alt="Ryan" width="75" src="https://media.licdn.com/dms/image/D4E03AQFAbg5Mt0mzHw/profile-displayphoto-shrink_200_200/0/1667417343436?e=1682553600&v=beta&t=RhEB2cemwMoMrLFIRoWxoo0rJtC_E2p49IKcCgj7Vew"/>](https://www.linkedin.com/in/ryan-canton-6a4854255/) |
| ----------- |
| Ryan Canton |
| [GitHub](https://github.com/ryancanton) | 
| [LinkedIn](https://www.linkedin.com/in/ryan-canton-6a4854255/) |
