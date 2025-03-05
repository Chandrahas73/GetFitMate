CREATE DATABASE fitness_companion;
USE fitness_companion;

-- Users table for authentication and profiles
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    height DECIMAL(5,2), -- in cm
    weight DECIMAL(5,2), -- in kg
    goal ENUM('Lose Weight', 'Maintain', 'Gain Muscle'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Workouts table storing available exercises
CREATE TABLE workouts (
    workout_id INT AUTO_INCREMENT PRIMARY KEY,
    workout_name VARCHAR(100) NOT NULL,
    muscle_group ENUM('Chest', 'Back', 'Legs', 'Arms', 'Shoulders', 'Core', 'Full Body'),
    difficulty ENUM('Beginner', 'Intermediate', 'Advanced'),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User workouts to track user activity
CREATE TABLE user_workouts (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    workout_id INT,
    date DATE NOT NULL,
    sets INT,
    reps INT,
    weight_used DECIMAL(5,2),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (workout_id) REFERENCES workouts(workout_id) ON DELETE CASCADE
);

-- Nutrition table for recommended food items
CREATE TABLE nutrition (
    food_id INT AUTO_INCREMENT PRIMARY KEY,
    food_name VARCHAR(100) NOT NULL,
    calories INT NOT NULL,
    protein DECIMAL(5,2),
    carbs DECIMAL(5,2),
    fats DECIMAL(5,2)
);

-- User meal tracking
CREATE TABLE user_meals (
    meal_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    food_id INT,
    meal_type ENUM('Breakfast', 'Lunch', 'Dinner', 'Snack'),
    date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (food_id) REFERENCES nutrition(food_id) ON DELETE CASCADE
);

-- BMR calculations for users
CREATE TABLE user_bmr (
    bmr_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    bmr_value DECIMAL(6,2),
    date_calculated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Progress tracking
CREATE TABLE progress (
    progress_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    weight DECIMAL(5,2),
    body_fat_percentage DECIMAL(5,2),
    muscle_mass DECIMAL(5,2),
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
