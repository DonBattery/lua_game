## Reserved Words

The following words are reserved and cannot be used as identifiers (e.g. variable names, function names, etc.):

|        |        |          |
|--------|--------|----------|
| nil    | do     | in       |
| true   | end    | or       |
| false  | for    | and      |
| if     | while  | not      |
| else   | repeat | local    |
| elseif | until  | function |
| then   | break  | return   |
|        |        |          |

## Operators

| Operator | Description |
|----------|-------------|
| and      | Logical and |
| or       | Logical or |
| not      | Logical not |
| ==       | Equal |
| ~=       | Not equal |
| <        | Less than |
| >        | Greater than |
| <=       | Less than or equal |
| >=       | Greater than or equal |
| +        | Addition    |
| -        | Subtraction |
| *        | Multiplication |
| /        | Division |
| %        | Modulus |
| ^        | Exponentiation |
| #        | Length |
| ..       | Concatenation |

## Comments

Comments are used to annotate code. They are ignored by the interpreter. There are two types of comments in Lua:

* Single line comments start with `--` and end at the end of the line.
* Multi-line comments start with `--[[` and end with `]]`.  

```Lua
-- This is a single line comment

--[[

This is a multi-line comment
It can span multiple lines

]]

print("Hello from Lua!") -- we can also have comments at the end of a line
```

## Variables

Variables are used to store values. The can either declared in the local scope using the `local` keyword or in the global scope without the keyword. Variables can be assigned a value using the `=` operator. Variables can be reassigned a new value at any time.

```Lua
local x = 10
print(x) -- 10

x = 20
print(x) -- 20


Y = 30 -- global variables are starting with Uppercase letters by convention
print(Y) -- 30

_G.Z = 40 -- we can use the _G to explicitly refer to the global scope
print(Z) -- 40
```

## Data Types

Lua is a dynamically typed language. This means that the type of a variable is determined at runtime. Lua has 8 basic types:

* `nil` - the type of the value `nil`, whose main property is to be different from any other value
* `boolean` - booleans, which may have one of two values: `false` and `true`
* `number` - double-precision floating-point numbers
* `string` - strings of characters
* `function` - functions
* `userdata` - values with type `userdata` represent C data stored in Lua variables
* `thread` - coroutines
* `table` - tables, which implement associative arrays

```Lua
local x = nil
print(x) -- nil

local y = true
print(y) -- true

local z = 10
print(z) -- 10

local w = "Hello"
print(w) -- Hello

local v = function() end
print(v) -- function: 0x7f8b6a500a90

local u = coroutine.create(function() end)
print(u) -- thread: 0x7f8b6a500a90

local t = {}
print(t) -- table: 0x7f8b6a500a90
```

## Strings

Strings are sequences of characters. They can be enclosed in single or double quotes. Strings can be concatenated using the `..` operator.

```Lua
local x = "Hello"

local y = 'from Lua!'

local z = x .. " " .. y

print(z) -- Hello from Lua!
```

## Numbers

Numbers are double-precision floating-point numbers (float64). They can be written with or without a decimal point. They can also be written in scientific notation.

```Lua
local x = 10
print(x) -- 10

local y = 10.5
print(y) -- 10.5

local z = 1e5
print(z) -- 100000
```

## Booleans

Booleans can have one of two values: `true` or `false`.

```Lua
local x = true
print(x) -- true

local y = false
print(y) -- false
```

## Tables

Tables are the only complex data structure in Lua. They are associative arrays. They can be used to store key-value pairs. The keys can be any value string, number or even other tables or functions. They are used to represent modules, objects, arrays, maps, etc.

```Lua
local x = { a = 10, b = 20, c = 30 }

print(x.a) -- 10
print(x.b) -- 20
print(x.c) -- 30

local y = { 10, 20, 30 }

print(y[1]) -- 10
print(y[2]) -- 20
print(y[3]) -- 30

local z = { a = { 10, 20, 30 }, b = { 40, 50, 60 } }

print(z.a[1]) -- 10
print(z.a[2]) -- 20
print(z.a[3]) -- 30

print(z.b[1]) -- 40
print(z.b[2]) -- 50
print(z.b[3]) -- 60
```

## Functions

Functions are first class citizens in Lua. They can be assigned to variables, passed as arguments to other functions and returned from functions. Functions can be declared using the `function` keyword. They can be declared anonymously or with a name. Functions can have multiple return values.

```Lua
local empty_function = function() end

local a_function_with_multiple_return_values = function()
    return 1, 2, 3
end

a, b, c = a_function_with_multiple_return_values()
print(a, b, c) -- 1 2 3

local add = function(a, b) 
    return a + b
end

print(add(10, 20)) -- 30

-- A factorial is defined as n! = n * ( n – 1 ) * ( n – 2 ) … (n – ( n – 1 ) ) where 1! = 1 and 0! = 1.
local function factorial ( a )
    if a <= 1 then
        return a
    end

    return a * factorial( a - 1 )
end

print(factorial(5)) -- 120
```

## Control Flow

### If-Else

The `if` statement is used to execute a block of code if a condition is true. The `else` statement is used to execute a block of code if the condition is false. The `elseif` statement is used to execute a block of code if the previous condition is false and the current condition is true.

```Lua
local x = 10

if x == 10 then
    print("x is 10")
elseif x == 20 then
    print("x is 20")
else
    print("x is not 10 or 20")
end
```

### While

The `while` statement is used to execute a block of code while a condition is true.

```Lua
local x = 10

while x > 0 do
    print(x)
    x = x - 1
end
```

### Repeat

The `repeat` statement is used to execute a block of code until a condition is true.

```Lua
local x = 10

repeat
    print(x)
    x = x - 1
until x == 0
```

### For

The `for` statement is used to execute a block of code a certain number of times. It can be used to iterate over the elements of a table (or an iterator function).

```Lua
for i = 1, 10 do
    print(i)
end

for i = 10, 1, -1 do
    print(i)
end

local x = { 10, 20, 30 }

-- # is the length operator and it returns the length of a table
for i = 1, #x do
    print(x[i])
end

-- ipairs is an iterator function that returns the index and the value of each element in a table
for index, value in ipairs(my_table) do
    print("Index:", index, "Value:", value)
end

-- pairs is an iterator function that returns the key and the value of each element in a table
for key, value in pairs(my_table) do
    print("Key:", key, "Value:", value)
end
```

### Break

The `break` statement is used to exit a loop.

```Lua
local x = 10

while x > 0 do
    print(x)
    x = x - 1

    if x == 5 then
        break
    end
end
```

### Return

The `return` statement is used to return a value from a function.

```Lua
local function add(a, b)
    return a + b
end

print(add(10, 20)) -- 30
```

## Modules

Modules are used to organize code. They are used to group related code together. They can be used to create objects, classes, etc. Modules are represented as tables in Lua. They can be loaded using the `require` function. The `require` function takes a string as an argument and returns a table. The string argument is the name of the module. The module name is the name of the file without the `.lua` extension. The module file must be in the same directory as the file that is requiring it.

```Lua

-- module.lua
local module = {}

function module.add(a, b)
    return a + b
end

return module

-- main.lua

local module = require("module")

print(module.add(10, 20)) -- 30
```

## Metatables

Metatables are used to define the behavior of tables. They are used to define how tables behave when used with operators. They are used to implement object oriented programming in Lua. They are used to implement inheritance, operator overloading, etc. Metatables are represented as tables in Lua. They can be set using the `setmetatable` function. They can be retrieved using the `getmetatable` function.

```Lua
local x = { a = 10, b = 20 }

local y = { c = 30, d = 40 }

local z = setmetatable(x, { __index = y })

print(z.a) -- 10
print(z.b) -- 20

print(z.c) -- 30
print(z.d) -- 40
```

## Object Oriented Programming

Object oriented programming can be implemented in Lua using metatables. The following example shows how to implement inheritance in Lua.

```Lua
local parent = {}

function parent.new()
    local instance = {}

    setmetatable(instance, { __index = parent })

    return instance
end

function parent.add(a, b)
    return a + b
end

local child = parent.new()

print(child.add(10, 20)) -- 30
```

## Coroutines

Coroutines are used to implement cooperative multitasking. They are similar to threads but they are not executed in parallel. They are executed in a cooperative manner. They are represented as threads in Lua. They can be created using the `coroutine.create` function. They can be resumed using the `coroutine.resume` function. They can be yielded using the `coroutine.yield` function.

```Lua
local function coroutine_function()
    print("Hello from coroutine!")

    coroutine.yield()

    print("Hello again from coroutine!")
end

local coroutine_thread = coroutine.create(coroutine_function)

coroutine.resume(coroutine_thread) -- Hello from coroutine!

coroutine.resume(coroutine_thread) -- Hello again from coroutine!
```

## Error Handling

Errors can be handled using the `pcall` function. It takes a function as an argument and returns a boolean and the return values of the function. If the function succeeds, the boolean is true and the return values are returned. If the function fails, the boolean is false and the error message is returned.

```Lua
local function add(a, b)
    return a + b
end

local status, result = pcall(add, 10, 20)

print(status) -- true
print(result) -- 30

local status, result = pcall(add, 10, "20")

print(status) -- false
print(result) -- attempt to perform arithmetic on a string value
```

We can also raise errors using the `error` function. It takes a string as an argument and raises an error with that string as the error message.

```Lua
local function add(a, b)
    if type(a) ~= "number" then
        error("a must be a number")
    end

    if type(b) ~= "number" then
        error("b must be a number")
    end

    return a + b
end

local status, result = pcall(add, 10, "20")

print(status) -- false

print(result) -- main.lua:3: a must be a number
```

## The Standard Library

The standard library is a collection of functions and modules that are included with Lua. They are loaded using the `require` function. The standard library is divided into several modules. The following modules are included with Lua:

* `coroutine` - provides functions for coroutine manipulation
* `package` - provides functions for loading modules
* `string` - provides functions for string manipulation
* `table` - provides functions for table manipulation
* `math` - provides functions for mathematical operations
* `io` - provides functions for file manipulation
* `os` - provides functions for operating system operations
* `debug` - provides functions for debugging
