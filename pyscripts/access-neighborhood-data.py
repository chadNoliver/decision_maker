import requests
api_url = "https://maps.nola.gov/server/rest/services/Reference/Reference_Layers/MapServer/0/query?where=OBJECTID%3E0&outFields=*&returnGeometry=true&f=geojson"
results = requests.get(api_url)
with open("neighborhoods.geojson", "w") as outfile:
  outfile.write(results.content.decode('utf-8'))