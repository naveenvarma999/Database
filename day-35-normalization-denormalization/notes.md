# Day 35 - Normalization and Denormalization

## What I learned

Normalization means organizing tables to avoid duplicate data.

Denormalization means intentionally storing repeated data to make reading faster.

## Simple meaning

Normalization = clean design

Denormalization = faster read, but more maintenance

## Why normalization is useful

It avoids duplicate data.

It reduces update mistakes.

It keeps data clean.

## Example

Instead of storing owner name and email inside properties table, we store owner details in users table and store only owner_id in properties table.

## 1NF

Each column should store one clear value.

## 2NF

If a table has a composite key, other columns should depend on the full key.

## 3NF

Do not store data that depends on another non-key column.

## Denormalization example

Adding saved_count directly in properties table can make reads faster, but we must keep that value updated correctly.

## Interview answer

Normalization is the process of organizing database tables to reduce duplicate data and improve consistency. Denormalization is the process of intentionally adding some duplicate or precomputed data to improve read performance. In real projects, we usually normalize first and denormalize later only when performance requires it.