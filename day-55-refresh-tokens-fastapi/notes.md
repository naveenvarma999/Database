# Day 55 - Refresh Tokens in FastAPI

## What I learned

A refresh token is used to get a new access token.

## Token types

Access token is used for protected routes.

Refresh token is used only to generate a new access token.

## Why refresh tokens are useful

Access tokens should expire quickly for security.

Refresh tokens allow users to stay logged in without entering password again.

## Important routes

/login gives access token and refresh token.

/me requires access token.

/refresh requires refresh token and returns new tokens.

## Main memory

Access token = access APIs.

Refresh token = get new access token.