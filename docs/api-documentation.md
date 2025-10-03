# \# Gaming Platform API Documentation

# 

# \## Base URLs

# \- Development: `https://echo.getpostman.com`

# \- Staging: `https://api-staging.gaming-platform.com`

# \- Production: `https://api.gaming-platform.com`

# 

# \## Authentication

# 

# \### POST /auth/operator/login

# Authenticates an operator and returns an access token.

# 

# \*\*Request:\*\*

# ```json

# {

# &nbsp; "operatorId": "starlight\_gaming\_demo",

# &nbsp; "operatorSecret": "secret\_star\_2024",

# &nbsp; "loginType": "api\_integration"

# }

# Response:

# json{

# &nbsp; "status": "success",

# &nbsp; "authToken": "eyJhbGciOiJIUzI1NiIs...",

# &nbsp; "operatorId": "starlight\_gaming\_demo",

# &nbsp; "expiresIn": 3600,

# &nbsp; "permissions": \["game\_launch", "transactions"]

}

===

# \### Game Management

# GET /games/catalog

# Retrieves available games for the authenticated operator.

# Headers:

# 

# Authorization: Bearer {token}

# 

# Query Parameters:

# 

# operatorId: string (required)

# category: slot|table|live (optional)

# limit: number (optional, default: 50)

# 

# Response:

# json{

# &nbsp; "status": "success",

# &nbsp; "games": \[

# &nbsp;   {

# &nbsp;     "gameId": "cosmic\_fortune\_spin",

# &nbsp;     "gameName": "Cosmic Fortune Spin",

# &nbsp;     "gameType": "slot",

# &nbsp;     "provider": "Gaming Studio",

# &nbsp;     "categories": \["slot", "featured"]

# &nbsp;   }

# &nbsp; ],

# &nbsp; "totalCount": 45

# }

# POST /games/launch

# Launches a game for a specific player.

# Request:

# json{

# &nbsp; "gameId": "cosmic\_fortune\_spin",

# &nbsp; "playerId": "player\_alpha\_123",

# &nbsp; "operatorId": "starlight\_gaming\_demo",

# &nbsp; "currency": "EUR",

# &nbsp; "mode": "real",

# &nbsp; "returnUrl": "https://operator-site.com/lobby",

# &nbsp; "language": "en"

# }

# Response:

# json{

# &nbsp; "status": "success",

# &nbsp; "gameUrl": "https://game-server.com/play/...",

# &nbsp; "sessionId": "session\_abc123",

# &nbsp; "expiresAt": "2024-12-15T12:00:00Z"

# }

# Transaction Processing

# POST /transactions/bet

# Processes a bet transaction.

# Request:

# json{

# &nbsp; "playerId": "player\_alpha\_123",

# &nbsp; "gameId": "cosmic\_fortune\_spin",

# &nbsp; "sessionId": "session\_abc123",

# &nbsp; "betAmount": 1.00,

# &nbsp; "currency": "EUR",

# &nbsp; "roundId": "round\_xyz",

# &nbsp; "transactionId": "bet\_unique\_id"

# }

# Response:

# json{

# &nbsp; "status": "success",

# &nbsp; "transactionId": "bet\_unique\_id",

# &nbsp; "newBalance": 99.00,

# &nbsp; "currency": "EUR",

# &nbsp; "timestamp": "2024-12-15T10:30:00Z"

# }

# POST /transactions/win

# Processes a win transaction.

# Request:

# json{

# &nbsp; "playerId": "player\_alpha\_123",

# &nbsp; "gameId": "cosmic\_fortune\_spin",

# &nbsp; "sessionId": "session\_abc123",

# &nbsp; "winAmount": 5.00,

# &nbsp; "currency": "EUR",

# &nbsp; "roundId": "round\_xyz",

# &nbsp; "transactionId": "win\_unique\_id",

# &nbsp; "relatedTransactionId": "bet\_unique\_id"

# }

# Error Responses

# 401 Unauthorized:

# json{

# &nbsp; "status": "error",

# &nbsp; "error": {

# &nbsp;   "code": "UNAUTHORIZED",

# &nbsp;   "message": "Invalid or expired token"

# &nbsp; }

# }

# 400 Bad Request:

# json{

# &nbsp; "status": "error",

# &nbsp; "error": {

# &nbsp;   "code": "INSUFFICIENT\_FUNDS",

# &nbsp;   "message": "Player balance too low",

# &nbsp;   "details": {

# &nbsp;     "currentBalance": 5.50,

# &nbsp;     "requestedAmount": 10.00

# &nbsp;   }

# &nbsp; }

# }

# Used for: Production monitoring

