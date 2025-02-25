import numpy as np

def generate_random_data(filename, length, min_val, max_val, integer=True):
    """Generates random integer data and writes it to a file."""
    if integer:
        data = np.random.randint(min_val, max_val + 1, length)
    else:
        data = np.random.uniform(min_val, max_val, length)
    
    with open(filename, 'w') as file:
        for value in data:
            file.write(f"{value:.0f}\n")
    return data

def read_input_file(filename):
    with open(filename, 'r') as file:
        return [float(line.strip()) for line in file.readlines()]

def fir_filter(input_data, coefficients, tape_num, output_length=None):
    """x[i]*coef[0] + x[i-1]*coef[1] + ... + x[i-10]*coef[10]"""
    output_length = output_length or len(input_data)
    output_data = []
    
    for i in range(output_length):
        value = sum(coefficients[j] * (input_data[i - j] if (i - j) >= 0 else 0) for j in range(tape_num))
        output_data.append(int(round(value)))
    return output_data

def write_output_file(filename, data):
    with open(filename, 'w') as file:
        for value in data:
            file.write(f"{value:.0f}\n")

def main():
    data_len = int(input("Enter data length (x.dat): "))
    coef_len = int(input("Enter coefficient length (coef.dat): "))
    
    x_filename = 'x.dat'
    coef_filename = 'coef.dat'
    output_filename = 'y.dat'
    
    # Generate random integer data
    input_data = generate_random_data(x_filename, data_len,-100000,100000, integer=True)
    coefficients = generate_random_data(coef_filename, coef_len,-10,10, integer=True)
    
    # Apply FIR filter
    output_data = fir_filter(input_data, coefficients, tape_num=coef_len, output_length=data_len)
    
    # Write output data
    write_output_file(output_filename, output_data)
    
    print(f"Generated {x_filename} and {coef_filename}, computed {output_filename}.")

if __name__ == "__main__":
    main()
