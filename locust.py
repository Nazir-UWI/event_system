import time
from locust import HttpUser, task, between

class WebsiteUser(HttpUser):
    wait_time = between (1, 5)

    @task
    def auth_register(self):
        self.client.post("/register", json={"email": "testuser100@example.com", "password": "SecurePass123!"})

    @task
    def auth_login(self):
        self.client.post("/login", json={"email": "testuser100@example.com", "password": "SecurePass123!"})

    @task
    def auth_user(self):
        self.client.get("/user", json={"email": "testuser100@example.com", "password": "SecurePass123!"})