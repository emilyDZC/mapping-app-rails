# mapping-app-rails

To run this app, first fork the repo and `cd` into the root directory.

The backend and frontend need to be run separately, so open up two terminal windows.

In the first terminal, run the following:
```
bundle install
rails s
```

In the second terminal, do the following:
```
cd client
npm i
npm start
```

The app should be available to view at `http://localhost:8080/`

The api endpoint for a single pair of coordinates is `POST http://localhost:3000/georegions/single`. It queries a dataset of Geographical Regions.
It receives a request body in the following format:
```
{
    "lat": 53.3,
    "long": 1.47
}
```
It returns the feature properties as output eg.
```
{
    "scalerank": 1,
    "name": "BRITISH ISLES",
    "namealt": null,
    "region": "Europe",
    "subregion": "British Isles",
    "featureclass": "Island group"
}
```
