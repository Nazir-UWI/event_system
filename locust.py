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

    # @task
    # def auth_user(self):
    #     self.client.get("/user", json={"email": "testuser100@example.com", "password": "SecurePass123!"})

    # @task
    # def event_events(self):
    #     self.client.get("/events", json={})
    
    # @task
    # def event_events5(self):
    #     self.client.get("/events/5", json={})

    # @task
    # def user_users(self):
    #     self.client.get("/users/1/events", json={})