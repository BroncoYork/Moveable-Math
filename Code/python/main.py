import tkinter
import time
from equations import *
from serial_functions import serial_initiate, serial_read, find_serial_com
from data_functions import clean_serial_data, interpret_data, interpret_raw_data, single_interpret_data
from tkinter import messagebox


def next_eq_button_click():
    global eq_problem, problem_index
    # On each button click, increment index variable
    problem_index = problem_index + 1
    # Set problem to solve to next equation
    eq_problem = equation_list[problem_index]
    tk_problem_eq.configure(text=eq_problem.text)


def window_close():
    # Confirm when user wants to close the window
    if messagebox.askokcancel("Quit", "Do you want to quit?"):
        tk_window.destroy()


# Setup Serial Device
find_serial_com()
serial_device = serial_initiate()

# Define Window
tk_window = tkinter.Tk()
tk_window.title("Moveable Math")
tk_window.geometry('1350x600')
tk_window.configure(bg='white')

# Set eq_live to zeros initially, set problem to solve to first in set
problem_index = 0
eq_live = eq(0, 0, 0)
eq_problem = equation_list[problem_index]

# Define Equation to Solve Label
tk_problem_eq = tkinter.Label(tk_window, text=eq_problem.text, font=("arial italic", 50), bg='white')
tk_problem_eq.grid(column=0, row=0)

# Define Live Equation Object
tk_live_eq = tkinter.Label(tk_window, text=eq_live.text, font=("atial bold", 150), bg='white')
tk_live_eq.grid(column=0, row=6)

# Define Next Equation Button
next_eq_button = tkinter.Button(tk_window, text="Next Equation", command=next_eq_button_click)
next_eq_button.grid(column=0, row=9)

# Define column_info to denote which column values correspond to variables
column_info = ['a', 'a', 'b', 'b', 'b', 'c', 'c', 'c']
# split_col = 4

# Continuous main loop
while 1:
    # Read in raw serial data and clean up
    raw_serial_data = str(serial_read(serial_device))

    data = clean_serial_data(raw_serial_data)

    # Get a, b, c variables from raw values
    int_data = single_interpret_data(data)
    a_live, b_live, c_live = interpret_data(int_data, column_info)
    # a_live, b_live, c_live = interpret_raw_data(data, split_col)

    # Update the live displayed equation on-screen with new values
    eq_live = eq(a_live, b_live, c_live)
    tk_live_eq.configure(text=eq_live.text)

    # Check to see if live equation is correct and display colors accordingly
    if eq_problem.x != eq_live.x:
        tk_live_eq.configure(bg='red')
    if eq_problem.x == eq_live.x:
        tk_live_eq.configure(bg='white')

    # Update window
    tk_window.update_idletasks()
    tk_window.update()

    # Check if user wants to close the window
    tk_window.protocol("WM_DELETE_WINDOW", window_close)

    # Delay 100 milliseconds for each reading/update
    time.sleep(0.1)
# Close serial device on program end
serial_device.close()
