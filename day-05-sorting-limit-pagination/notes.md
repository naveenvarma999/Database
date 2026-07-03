# Day 5 - Sorting, Limit, Offset, and Pagination

## What I learned

Sorting is used to arrange records in a specific order.

Pagination is used to show limited records per page instead of loading all records at once.

## Important SQL keywords

- ORDER BY: sorts records
- ASC: ascending order
- DESC: descending order
- LIMIT: controls number of records returned
- OFFSET: skips records
- COUNT: counts total records

## Real job examples

- Show newest users first
- Show properties low price to high price
- Show top 3 expensive properties
- Show 10 properties per page
- Build search results with pagination
- Count total records for frontend pagination

## Pagination formula

OFFSET = (page_number - 1) * page_size

Example:

page_number = 2  
page_size = 5  

OFFSET = (2 - 1) * 5 = 5

## Important rules

1. Use ORDER BY when using LIMIT.
2. Do not load all records at once.
3. Use LIMIT and OFFSET for pagination.
4. Select only required columns.
5. Use COUNT to get total records.

## Interview answer

Sorting is done using ORDER BY. Pagination is done using LIMIT and OFFSET. In real applications, pagination is important because loading thousands of records at once can make APIs slow and increase database load.