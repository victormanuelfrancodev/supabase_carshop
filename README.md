# Supabase SQL FUNCTIONS Example :zap:

This project demonstrates the use of **functions** in Supabase to enhance the efficiency of applications. It's designed using a clean architecture approach, leveraging Flutter for frontend and Supabase as backend service.

## Features :star:

- **Clean Architecture**: Ensures scalability and maintainability.
- **State Management**: Uses `InheritedWidget` for efficient state management across the app.
- **Supabase Integration**: Utilizes Supabase for real-time database interactions.
- **Environment Configuration**: Manages configuration through the `env` package for safe, scalable app settings.

## How It Works :gear:

The app simulates a car shop where users can view products, add them to their cart, and make purchases. The purchase logic is handled through a function in Supabase, which ensures all transactions are processed efficiently and securely.

### Create your .env file

Example 

```
SUPABASE_URL = 'supabase_url'
SUPABASE_KEY = 'supabase_key'
```

### BuyState Management

```dart
sealed class BuyState {}
class InitialState extends BuyState {}
class LoadingState extends BuyState {}
class LoadedState extends BuyState {
  LoadedState({required this.result});
  final String result;
}
class FailureState extends BuyState {}
```

### Functions and tables 

#### Purchase Table

| Column      | Type      |
|-------------|-----------|
| id          | int       |
| user_id     | int       |
| product_id  | int       |
| fee         | double    |
| create_at   | timestamp |

#### Products Table

| Column      | Type      |
|-------------|-----------|
| id          | int       |
| name        | varchar   |
| price       | double    |
| quantity    | int       |

#### Users Table

| Column      | Type      |
|-------------|-----------|
| id          | integer   |
| name        | text      |
| points      | integer   |
| create_at   | timestamp |


### Supabase SQL Functions 

```
DECLARE
    available_stock INT;
    product_id INT;
    total_price NUMERIC;
    failed_products TEXT := ''; 
BEGIN
    FOREACH product_id IN ARRAY product_ids LOOP  
        SELECT quantity INTO available_stock 
        FROM products 
        WHERE id = product_id;
        
        IF available_stock < 1 THEN
            failed_products := failed_products || 'Product ID: ' || product_id || ', ';
            CONTINUE; 
        END IF;
        
        SELECT price INTO total_price 
        FROM products 
        WHERE id = product_id;
        
        UPDATE products 
        SET quantity = quantity - 1
        WHERE id = product_id;
        
      
        INSERT INTO purchase(user_id, product_id, fee) 
        VALUES (user_id, product_id, total_price);
    END LOOP;

    UPDATE users 
    SET points = points + (
        SELECT SUM(price) / 10
        FROM products
        WHERE id = ANY(product_ids)  
    ) 
    WHERE id = user_id;

    IF failed_products = '' THEN
        RETURN 'Purchase successful for all products.';
    ELSE
        RETURN 'Purchase successful with exceptions. Failed to purchase: ' || rtrim(failed_products, ', ') || '.';
    END IF;
END;
```
