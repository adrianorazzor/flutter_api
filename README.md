# Flutter API

A Phoenix API backend for testing Flutter applications.

## Setup Instructions

1. Install dependencies:
```bash
mix deps.get
```

2. Start the Phoenix server:
```bash
mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## API Endpoints

### Login

**Endpoint:** `/login`
**Method:** POST
**Request Body:**
```json
{
  "email": "test@example.com",
  "senha": "password123"
}
```

**Successful Response:**
- Status Code: 200
- Headers: `authorization: Bearer <token>`
- Body:
```json
{
  "usuario_id": 1,
  "pessoa_id": 1
}
```

**Error Response:**
- Status Code: 401
- Body:
```json
{
  "error": "unauthorized",
  "message": "Invalid email or password"
}
```

## Test User

The API comes with a pre-configured test user:
- Email: test@example.com
- Password: password123
- pessoa_id: 1

## Notes

This API uses a simplified in-memory authentication system for testing purposes. No database setup is required for basic testing. In a production environment, you would want to use a database, proper password hashing, and JWT authentication.
