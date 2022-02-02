# import random
import random

# To determine the direction
# 1 for +x
# 2 for +y
# 3 for -x
# 4 for -y
direction = [1, 2, 3, 4]

# initial value assignment:
k = 0
generator = 0
rand_x = 0
rand_y = 0
row = 1000
col = 1000

# defining the 2D grid for Self Avoiding random walk (SAW):
# written in this way else one is unable to change a single element of the grid!
grid = [[0 for i in range(2 * col)] for j in range(2 * row)]

# inputs
print("Enter the total number of steps:")
steps = int(input())
print("Enter the step length:")
l = int(input())
print("Initial coordinates (x,y) one after another:")
x = int(input())
y = int(input())

rand_x = x + row
rand_y = y + col



grid[rand_x][rand_y] = 1  # initial position
# Finds single SAW path for given inputs:
while steps != 0:
    generator = random.choice(direction)

    if grid[rand_x + l][rand_y] == 0 and generator == 1:
        rand_x = rand_x + l
        grid[rand_x][rand_y] = 1  # final position
        steps = steps - 1
        print("+x", rand_x, rand_y)
    elif grid[rand_x][rand_y + l] == 0 and generator == 2:
        rand_y = rand_y + l
        grid[rand_x][rand_y] = 1  # final position
        steps = steps - 1
        print("+y", rand_x, rand_y)
    elif grid[rand_x - l][rand_y] == 0 and generator == 3:
        rand_x = rand_x - l
        grid[rand_x][rand_y] = 1  # final position
        steps = steps - 1
        print("-x", rand_x, rand_y)
    elif grid[rand_x][rand_y - l] == 0 and generator == 4:
        rand_y = rand_y - l
        grid[rand_x][rand_y] = 1  # final position
        steps = steps - 1
        print("-y", rand_x, rand_y)
    else:
        continue
