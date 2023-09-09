# DBT Training


## Setup with Docker Compose

Create a local database with Docker Compose. The database is a Postgres database with the Northwind database loaded.


```bash
# build
docker-compose -f docker-compose-dbt-db.yml build

# run
docker-compose -f docker-compose-dbt-db.yml up

# remove
docker-compose -f docker-compose-dbt-db.yml down
```


## Use Case - Northwind

This use cases Northwind database. The database is a sample database that was originally created by Microsoft and used as the basis for their tutorials in a variety of database products for decades. The database itself is no longer maintained by Microsoft, but you can still download the data and use it to learn about SQL and database concepts.

https://github.com/dalers/mywind/blob/master/README.md

List of tables

- northwind.employees
- northwind.customers
- northwind.sales_reports
- northwind.strings
- northwind.employee_privileges
- northwind.privileges
- northwind.inventory_transaction_types
- northwind.orders
- northwind.shippers
- northwind.orders_tax_status
- northwind.orders_status
- northwind.products
- northwind.purchase_orders
- northwind.purchase_order_status
- northwind.suppliers
- northwind.inventory_transactions
- northwind.invoices
- northwind.order_details
- northwind.order_details_status
- northwind.purchase_order_details

List all northwind tables in a sql query

```sql
select * from pg_catalog.pg_tables pt
where schemaname = 'northwind';
```


## References

https://github.com/dalers/mywind/blob/master/README.md