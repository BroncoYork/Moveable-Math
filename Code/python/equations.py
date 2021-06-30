class eq:
    # Define equation class
    # aX + b = c is the form of the equation
    def __init__(self, a, b, c):
        self.a = a
        self.b = b
        self.c = c

        # Check if x is multiplied by zero
        if self.a != 0:
            self.x = (c - b) / a
        if self.a == 0:
            self.x = 0

        # Do not display a if a equals 1, and remove b if b equals 0
        if self.a == 1:
            self.text = "X" + " + " + str(self.b) + " = " + str(self.c)
            if self.b == 0:
                self.text = "X" + "=" + str(self.c)
        if self.a != 1:
            self.text = str(self.a) + "X" + " + " + str(self.b) + " = " + str(self.c)
            if self.b == 0:
                self.text = str(self.a) + "X" + " = " + str(self.c)


# Define preset equations (there might be a more efficient method)
eq_1 = eq(1, 3, 7)
eq_2 = eq(1, 4, 9)
eq_3 = eq(1, 2, 5)
eq_4 = eq(2, 4, 8)

# Create list of equation objects
equation_list = [eq_1, eq_2, eq_3, eq_4]
