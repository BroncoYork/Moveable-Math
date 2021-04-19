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
