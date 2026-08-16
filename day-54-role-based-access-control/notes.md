# Day 54 - Role-Based Access Control

## What I learned

RBAC means Role-Based Access Control.

It decides what a logged-in user is allowed to do.

## Simple meaning

Authentication checks who the user is.

Authorization checks what the user can access.

## Roles

USER can access normal routes.

ADMIN can access admin routes.

## Important functions

get_current_user checks JWT token and returns logged-in user.

require_admin checks whether logged-in user has ADMIN role.

## Status codes

401 means not logged in or invalid token.

403 means logged in but not allowed.

## Main memory

JWT proves login.

Role decides permission.