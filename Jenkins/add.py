# add.py
import os

# Get the numbers from environment variables
num1 = float(os.getenv("NUM1", 0))
num2 = float(os.getenv("NUM2", 0))

# Perform addition
result = num1 + num2
print(f"The result of {num1} + {num2} is {result}")
