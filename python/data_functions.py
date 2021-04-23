def clean_serial_data(raw_serial_data):
    # Clean up raw arduino serial data by removing excess characters
    raw_serial_data = raw_serial_data.replace("b'", "").replace("r", "")\
        .replace('\\', "").replace("n", "").replace("'", "")

    # Create list of integers from string
    data = raw_serial_data.split(",")
    data = list(map(int, data))
    return data


def interpret_data(data, column_info):
    a = 0
    b = 0
    c = 0
    # For each column, sum the raw values based on which variables each column
    # corresponds to
    for i in range(len(column_info)):
        if column_info[i] == 'a':
            a = a + data[i]
        if column_info[i] == 'b':
            b = b + data[i]
        if column_info[i] == 'c':
            c = c + data[i]
    return a, b, c


def single_interpret_data(data):
    int_data = [0, 0, 0, 0, 0, 0, 0, 0]
    for i in range(len(data)):
        if data[i] >= 0 and data[i] <= 10:
            int_data[i] = 0
        if data[i] >= 150 and data[i] <= 350:
            int_data[i] = 1
        if data[i] >= 400 and data[i] <= 520:
            int_data[i] = 2
        if data[i] >= 550 and data[i] <= 610:
            int_data[i] = 3
        if data[i] >= 640 and data[i] <= 680:
            int_data[i] = 4
        if data[i] >= 690 and data[i] <= 800:
            int_data[i] = 5
    return int_data

def interpret_raw_data(data, split_col):
    a = 0
    b = 0
    c = 0


    resistor_lookup = {
        0: [0, 0],
        130: [1, 0],
        233: [2, 0],
        316: [3, 0],
        382: [4, 0],
        437: [5, 0],
        # 0, 1 key values
        range(317, 320): [0, 1],
        385: [1, 1],
        439: [2, 1],
        485: [3, 1],
        525: [4, 1],
        range(486, 488): [0, 2],
        526: [1, 2],
        560: [2, 2],
        589: [3, 2],
        590: [0, 3],
        616: [1, 3],
        639: [2, 3],
        660: [0, 4],
        679: [1, 4],
        711: [0, 5]
    }
    for x in range(0, len(data)-split_col):
        paired_values = resistor_lookup[data[x]]
        a = paired_values[0]
        b = paired_values[1]
    for x in range(split_col, len(data)):
        paired_values = resistor_lookup[data[x]]
        c = paired_values[0]
    return a, b, c
