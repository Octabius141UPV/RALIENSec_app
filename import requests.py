import requests

url = "https://ralien-django-backend-2phw75janq-no.a.run.app/api/loginUserApi/"

payload = {
    "username": "username",
    "password": "password"
}
response = requests.request("POST", url, data=payload)

print(response.text)